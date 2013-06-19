# mruby-ipaddr

[IPAddr](http://www.ruby-doc.org/stdlib-2.0/libdoc/ipaddr/rdoc/IPAddr.html) class for mruby

## Requirement
- [mruby-socket](https://github.com/iij/mruby-socket)
- inet\_ntop(3) and inet\_pton(3)

## Limitation

- Some methods are missing:
  #& #<< #>> #in6\_arpa #ip6\_int #ipv4\_compat? #ipv4\_mapped #ipv4\_mapped?
  #mask! #native #reverse #set #succ #to\_i #to\_range #|
- Conversion from/to Integer is not supported.

## License

Copyright (c) 2013 Internet Initiative Japan Inc.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
