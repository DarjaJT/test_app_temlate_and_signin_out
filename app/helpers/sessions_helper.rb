module SessionsHelper

  def sign_in(user) # places the generated token in the browser
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in? # The user is logged in if the current user exists in the session
    !current_user.nil?
  end

  def current_user=(user) # saves the user
    @current_user = user
  end

  def current_user # Search current user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user) # check for the correct user
    user == current_user
  end

  def sign_out # delete cookies and session
    current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default) # redirect users to the page they request
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location # puts the requested URL in the session variable
    session[:return_to] = request.url if request.get?
  end

end