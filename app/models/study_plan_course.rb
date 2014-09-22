class StudyPlanCourse < ActiveRecord::Base

  belongs_to :study_plan
  belongs_to :course
end
