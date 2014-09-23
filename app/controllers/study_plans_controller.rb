class StudyPlansController < ApplicationController
  before_action :set_study_plan

  def index
    @courses = Course.all
  end

  def add_course
    course = Course.find(params[:course_id])
    add_course = ! @study_plan.courses.include?(course)
    @study_plan.courses.append course if add_course
    respond_to do |f|
      f.html { redirect_to action: :index }
      if add_course
        f.js { @course = Course.find(params[:course_id]) }
      else
        f.js
      end
    end
  end

  def remove_course
    StudyPlanCourse.where(course_id: params[:course_id], study_plan_id: @study_plan.id).delete_all
    respond_to do |f|
      f.html { redirect_to action: :index }
      f.js
    end
  end

  private
  def set_study_plan
    @study_plan = StudyPlan.first
  end
end
