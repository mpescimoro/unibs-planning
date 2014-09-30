class Lesson < ActiveRecord::Base
  DAYS = (0..4).to_a
  DAYS_NAMES = %w{Lunedì Martedì Mercoledì Giovedì Venerdì}
  HOURS = (0..9).to_a
  HOURS_NAMES = HOURS.map { |h| "#{h+8}:30" }

  has_many :room_lessons
  has_many :rooms, through: :room_lessons

  belongs_to :course
  has_many :teachers, through: :courses

  def color(study_plan_id)
    study_plan_course = self.course.study_plan_courses.where(study_plan_id: study_plan_id).first
    study_plan_course.color ? study_plan_course.color.hex : ''
  end
end
