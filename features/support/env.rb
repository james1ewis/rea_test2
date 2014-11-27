$LOAD_PATH.push File.join(File.dirname(__FILE__), "/../../lib" )
ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

require 'aruba/cucumber'
