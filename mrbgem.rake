MRuby::Gem::Specification.new('mruby-ipaddr') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Internet Initiative Japan Inc.'
  spec.add_dependency 'mruby-sprintf'
  spec.add_dependency 'mruby-pack'
  spec.add_dependency 'mruby-socket'
end
