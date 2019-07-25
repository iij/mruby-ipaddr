MRuby::Build.new do |conf|
  case ENV['MRUBY_TOOLCHAIN']
  when 'cl'
    toolchain :visualcpp
  when 'clang'
    toolchain :clang
  else
    toolchain :gcc
  end

  case ENV['MRUBY_INT_SIZE']
  when 'MRB_INT16'
    conf.compilers.each {|c| c.defines += %w(MRB_INT16) }
  when 'MRB_INT32'
    conf.compilers.each {|c| c.defines += %w(MRB_INT32) }
  when 'MRB_INT64'
    conf.compilers.each {|c| c.defines += %w(MRB_INT64) }
  end

  conf.compilers.each do |c|
    c.defines += %w(MRB_GC_STRESS MRB_GC_FIXED_ARENA)
  end

  enable_debug
  conf.enable_test
  conf.gem File.expand_path(File.dirname(__FILE__))
end
