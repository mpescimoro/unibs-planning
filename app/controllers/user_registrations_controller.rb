class UserRegistrationsController < Devise::RegistrationsController

  def create
    super

    study_plan = StudyPlan.new
    Course.where(degree_id: @user.degree_id, degree_year: @user.degree_year).each do |course|
      study_plan.courses.append course
    end
    study_plan.save
    @user.study_plan_id = study_plan.id
    @user.save
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :degree_id, :degree_year, :name)
  end
end
