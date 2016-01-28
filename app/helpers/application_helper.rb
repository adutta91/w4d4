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

  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_no_user!
    render json: current_user if current_user
  end
end
