class StudyPlanCourse < ActiveRecord::Base
  before_save :set_random_color_if_unset

  belongs_to :study_plan
  belongs_to :course
  belongs_to :color

  private
  def set_random_color_if_unset
    self.color_id = Color.offset(rand(Color.count)).first.id unless self.color_id
  end
end
