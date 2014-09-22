class Course < ActiveRecord::Base

  has_many :study_plan_courses
  has_many :study_plans, through: :study_plan_courses
  belongs_to :degree

  def academic_year
    "A.A. #{year}/#{year+1}"
  end
end
