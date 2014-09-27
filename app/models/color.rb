class Color < ActiveRecord::Base
  has_many :study_plan_courses
end
