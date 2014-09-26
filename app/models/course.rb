class Course < ActiveRecord::Base

  has_many :lessons
  belongs_to :degree

  has_many :study_plan_courses
  has_many :study_plans, through: :study_plan_courses

  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses

  def academic_year
    "A.A. #{year}/#{year+1}"
  end

  def html_id
    "#{self.class}#{id}"
  end
end
