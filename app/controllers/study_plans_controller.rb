class StudyPlansController < ApplicationController
  before_action :set_study_plan, only: [:show, :add_course, :remove_course, :change_course_color, :rename_course]

  def index
    redirect_to study_plan_path(StudyPlan.first)
  end

  def show
    @timetable = Timetable.new(@study_plan)
    @courses = Course.all
  end

  def add_course
    course = Course.find(params[:course_id])
    add_course = ! @study_plan.courses.include?(course)
    if add_course
      @study_plan.courses.append course
      course.set_color(Color.offset(rand(Color.count)).first, @study_plan)
    end

    @timetable = Timetable.new(@study_plan)

    respond_to do |f|
      f.html { redirect_to @study_plan }
      if add_course
        f.js { @course = Course.find(params[:course_id]) }
      else
        f.js # TODO risposta senza context-switch
      end
    end
  end

  def remove_course
    StudyPlanCourse.where(course_id: params[:course_id], study_plan_id: @study_plan.id).delete_all
    @timetable = Timetable.new(@study_plan)

    respond_to do |f|
      f.html { redirect_to @study_plan }
      f.js { @course = Course.find(params[:course_id]) }# TODO risposta senza context-switch
    end
  end

  def change_course_color
    @timetable = Timetable.new(@study_plan)

    s_p_course = @study_plan.study_plan_courses.where(course_id: params[:course_id]).first
    s_p_course.color = Color.find(params[:color_id])
    s_p_course.save

    respond_to do |f|
      f.html { redirect_to @study_plan }
      f.js { @course = Course.find(params[:course_id]) }
    end
  end

  def rename_course
    sp_course = @study_plan.study_plan_courses.where(course_id: params[:course_id]).first
    sp_course.short_name = params[:name]
    sp_course.save

    respond_to do |f|
      f.html { redirect_to @study_plan }
    end
  end

  private
  def set_study_plan
    @study_plan = StudyPlan.find(params[:id] || params[:study_plan_id])
  end
end
