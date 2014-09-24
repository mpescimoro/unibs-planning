class StudyPlansController < ApplicationController
  before_action :set_study_plan, only: [:show, :add_course, :remove_course]

  def index
    redirect_to study_plan_path(StudyPlan.first)
  end

  def show
    @timetable = Timetable.new(@study_plan.courses)
    @courses = Course.all
  end

  def add_course
    course = Course.find(params[:course_id])
    add_course = ! @study_plan.courses.include?(course)
    @study_plan.courses.append course if add_course

    @timetable = Timetable.new(@study_plan.courses)

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
    @timetable = Timetable.new(@study_plan.courses)

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
