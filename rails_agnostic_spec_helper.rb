if !defined?(Rails)
  ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__), ".."))

  $LOAD_PATH.unshift File.join(ROOT_PATH, 'app', 'models')
  $LOAD_PATH.unshift File.join(ROOT_PATH, 'app', 'controllers')
  $LOAD_PATH.unshift File.join(ROOT_PATH, 'app', 'helpers')
  $LOAD_PATH.unshift File.join(ROOT_PATH, 'lib')
end

def current_user_full_access
  user = mock_model(User, :allowed_to? => true)
  User.stub!(:current_user).and_return(user)
end

# If this is to run tests without rails you might find these useful. I keep them in a file called fast_spec_helper.rb
# USAGE:
# require 'fast_spec_helper'
# require_model 'model_being_tested'
# required_constants %w(DependancyModel OtherModel) #Best not to use this but keep short if you have to

APP_ROOT       = '../..'
APP_MODEL_PATH = 'app/models'
LIB_MODEL_PATH = 'lib/models'

def absolute_path(app_path_to_file)
  File.expand_path("#{APP_ROOT}/#{app_path_to_file}", __FILE__)
end

def construct_path(name, opts = {})
  app_path_to_file = (opts[:app_path] ? "#{opts[:app_path]}/#{name}" : name)
  app_path_to_file = "#{app_path_to_file}.rb"
  absolute_path(app_path_to_file)
end

def defaults
  { app_path: APP_MODEL_PATH }
end

def require_resource(name, opts = {})
  opts = defaults.merge(opts)
  require construct_path(name, opts)
end

def require_model(name, opts = {})
  opts[:app_path] = LIB_MODEL_PATH if opts.delete(:lib)
  require_resource(name, opts)
end

def required_constants(class_names)
  class_names.each do |class_name|
    unless Object.const_defined?(class_name)
      Object.const_set(class_name, Class.new)
    end
  end
end
