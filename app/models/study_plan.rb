class StudyPlan < ActiveRecord::Base

  has_many :study_plan_courses
  has_many :courses, through: :study_plan_courses

  has_one :user

  def color_for(course)
    self.study_plan_courses.where(course_id: course.id).first.color.hex
  end
end
