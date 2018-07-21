assert('IPAddr') do
  IPAddr.class == Class
end

assert('IPAddr#initialize') do
  n1 = IPAddr.new
  n2 = IPAddr.new('::')
  n3 = IPAddr.new('::', Socket::AF_UNSPEC)
  n4 = IPAddr.new('127.0.0.1')
  assert_equal(n1, n2)
  assert_equal(n1, n3)
  assert_not_equal(n1, n4)

  a = IPAddr.new('192.0.2.1/24')
  b = IPAddr.new('192.0.2.1/24', Socket::AF_INET)
  c = IPAddr.new('192.0.2.1/255.255.255.0')
  assert_equal(a, b)
  assert_equal(a, c)

  a = IPAddr.new('2001:db8::1/64')
  b = IPAddr.new('2001:db8::1/64', Socket::AF_INET6)
  c = IPAddr.new('2001:db8::1/ffff:ffff:ffff:ffff::')
  assert_equal(a, b)
  assert_equal(a, c)
end

assert('IPAddr.new_ntoh') do
  a = IPAddr.new_ntoh("\300\250\001\001")
  b = IPAddr.new("192.168.1.1")
  assert_equal(a, b)

  a = IPAddr.new_ntoh("\040\001\015\270\0\0\0\0\0\0\0\0\0\0\0\001")
  b = IPAddr.new("2001:db8::1")
  assert_equal(a, b)
end

assert('IPAddr.ntop') do
  IPAddr.ntop("\300\250\001\001") == "192.168.1.1" and
    IPAddr.ntop("\040\001\015\270\0\0\0\0\0\0\0\0\0\0\0\001") == "2001:db8::1"
end

assert('IPAddr#<=>') do
  x = IPAddr.new('1.1.1.1')
  a = IPAddr.new('1.1.1.0')
  b = IPAddr.new('1.1.1.2')
  c = IPAddr.new('1.1.1.1')
  d = IPAddr.new('2001:db8::1')
  (x <=> a) > 0 and (x <=> b) < 0 and (x <=> c) == 0 and (x <=> d) == nil
end

assert('IPAddr#==') do
  assert_true(IPAddr.new("192.168.0.1") == "192.168.0.1")
  assert_false(IPAddr.new("192.168.0.1") == IPAddr.new("192.168.0.1/24"))
end

assert('IPAddr#eql?') do
  assert_true(IPAddr.new("192.2.0.1").eql? IPAddr.new("192.2.0.1"))
  assert_false(IPAddr.new("192.2.0.1").eql? IPAddr.new("192.2.0.1/24"))
  assert_false(IPAddr.new("0.0.0.1").eql? IPAddr.new("::1"))
end

assert('IPAddr#family') do
  a = IPAddr.new('192.0.2.1', Socket::AF_INET)
  b = IPAddr.new('2001:db8::1', Socket::AF_INET6)
  c = IPAddr.new('192.0.2.1', Socket::AF_UNSPEC)
  d = IPAddr.new('2001:db8::1', Socket::AF_UNSPEC)
  a.family == Socket::AF_INET and
  b.family == Socket::AF_INET6 and
  c.family == Socket::AF_INET and
  d.family == Socket::AF_INET6
end

assert('IPAddr#hash') do
  a = IPAddr.new("192.0.2.1").hash
  b = IPAddr.new("192.0.2.1").hash
  c = IPAddr.new("192.0.2.2").hash
  a == b and a != c
end

assert('IPAddr#hton') do
  IPAddr.new('1.2.3.4').hton == "\x01\x02\x03\x04"
end

assert('IPAddr#ipv4?') do
  a = IPAddr.new('192.0.2.1', Socket::AF_INET)
  b = IPAddr.new('2001:db8::1', Socket::AF_INET6)
  c = IPAddr.new('192.0.2.1', Socket::AF_UNSPEC)
  d = IPAddr.new('2001:db8::1', Socket::AF_UNSPEC)
  a.ipv4? and (not b.ipv4?) and c.ipv4? and (not d.ipv4?)
end

assert('IPAddr#ipv6?') do
  a = IPAddr.new('192.0.2.1', Socket::AF_INET)
  b = IPAddr.new('2001:db8::1', Socket::AF_INET6)
  c = IPAddr.new('192.0.2.1', Socket::AF_UNSPEC)
  d = IPAddr.new('2001:db8::1', Socket::AF_UNSPEC)
  (not a.ipv6?) and b.ipv6? and (not c.ipv6?) and d.ipv6?
end

assert('IPAddr#mask') do
  IPAddr.new('192.0.2.1').mask(24).hton == "\xc0\x00\x02\x00"
end

assert('IPAddr#to_s') do
  IPAddr.new('192.0.2.1').to_s == '192.0.2.1' and
  IPAddr.new('2001:db8::3').to_s == '2001:db8::3'
end

assert('IPAddr#~') do
  (~IPAddr.new('192.0.2.1')).to_s == '63.255.253.254'
end

assert('IPAddr#include?') do
  IPAddr.new('192.168.2.0/24').include?('192.168.2.100')
  !IPAddr.new('192.168.2.0/24').include?('192.168.3.100')
end