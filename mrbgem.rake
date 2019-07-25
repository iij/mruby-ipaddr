MRuby::Gem::Specification.new('mruby-ipaddr') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Internet Initiative Japan Inc.'
  spec.add_dependency 'mruby-sprintf'
  spec.add_dependency 'mruby-pack'
  spec.add_dependency 'mruby-socket'
  if (/mswin|mingw|win32/ =~ RUBY_PLATFORM) then
    spec.linker.libraries << "wsock32"
    spec.linker.libraries << "ws2_32"
  end
end
