class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

#def generate_new_password_email
#  user = User.find(params[:user_id])
#  user.send_reset_password_instructions flash[:notice] = "Reset password instructions have been sent to #{user.email}."
#  redirect_to admin_user_path(user)
#end

end
