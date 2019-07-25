# variables
ENV['APP_NAME']         ||= File.basename(File.expand_path(__FILE__))
ENV['APP_ROOT']         ||= File.dirname(File.expand_path(__FILE__))
ENV['MRUBY_REPOSITORY'] ||= 'https://github.com/mruby/mruby.git'
ENV['MRUBY_BRANCH']     ||= 'master'
ENV['MRUBY_ROOT']       ||= "#{ENV['APP_ROOT']}/mruby"
ENV['MRUBY_CONFIG']     ||= "#{ENV['APP_ROOT']}/config.rb"
ENV['MRUBY_BUILD_DIR']  ||= "#{ENV['APP_ROOT']}/build"
ENV['INSTALL_DIR']      ||= "#{ENV['APP_ROOT']}/build/bin"

# mruby
unless File.exist?("#{ENV['MRUBY_ROOT']}/Rakefile")
  sh "git clone --branch #{ENV['MRUBY_BRANCH']} --depth 1 #{ENV['MRUBY_REPOSITORY']} #{ENV['MRUBY_ROOT']}"
end

# build
load "#{ENV['MRUBY_ROOT']}/Rakefile"
