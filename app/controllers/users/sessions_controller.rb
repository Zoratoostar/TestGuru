# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super

    if @user.first_name || @user.last_name
      flash[:notice] = "#{@user.first_name} #{@user.last_name}, salute!"
    else
      flash[:notice] = "Bonjour, #{@user.name}!"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    return admin_tests_path if current_user.is_a?(Admin)
    super
  end
end
