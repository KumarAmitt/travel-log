module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: { object: object })
  end

  def login_logout
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, method: :delete
    else
      link_to 'Login', new_user_session_path
    end
  end

  def home_signup
    if user_signed_in?
      link_to current_user.name, root_path
    else
      link_to 'Sign Up', new_user_registration_path
    end
  end

end
