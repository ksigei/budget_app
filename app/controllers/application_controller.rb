class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end

  def after_sign_out_for(_resources)
    redirect_to new_user_session
  end

  def after_sign_in_path_for(_resources)
    groups_path
  end

  def after_sign_up_path_for(_resources)
    groups_path
  end
end
