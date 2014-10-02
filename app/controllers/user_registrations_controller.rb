class UserRegistrationsController < Devise::RegistrationsController

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :degree_id, :degree_year, :name)
  end
end
