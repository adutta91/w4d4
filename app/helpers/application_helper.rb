module ApplicationHelper

  def auth_token
    token = <<-HTML
      <input type="hidden"
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
    token.html_safe
  end

  def current_user
    token = session[:session_token]
    return nil unless token
    @current_user ||= User.find_by(session_token: token)
  end

  def login_user!
    @user.reset_session_token!
    session[:session_token] = @user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_no_user!
    redirect_to bands_url if logged_in?
  end

  def require_login!
    redirect_to new_session_url unless logged_in?
  end

end
