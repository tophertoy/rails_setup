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