class StudyPlan < ActiveRecord::Base

  has_many :study_plan_courses
  has_many :courses, through: :study_plan_courses
# belongs_to :user
end
