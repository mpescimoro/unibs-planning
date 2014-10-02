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

  def set_color(color, study_plan)
    sp_course = self.study_plan_courses.where(study_plan_id: study_plan.id).first
    sp_course.color_id = color.id
    sp_course.save
  end

  def short_name(study_plan_id)
    sp_course = self.study_plan_courses.where(study_plan_id: study_plan_id).first
    sp_course.short_name.blank? ?  self.name : sp_course.short_name
  end

  def full_name
    name + (degree.short_name.blank? ? '' : " [#{degree.short_name}]")
  end
end
