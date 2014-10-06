class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    @user.set_default_study_plan(cookies[:study_plan_id])
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :degree_id, :degree_year, :name)
  end
end
