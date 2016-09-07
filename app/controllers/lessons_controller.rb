class LessonsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.new
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.new(lesson_params)

    if @lesson.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])

    if params[:next]
      @lesson = Lesson.find(params[:id]).next
    end

    if params[:previous]
      @lesson = Lesson.find(params[:id]).previous
    end  

  end

  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to course_lesson_path(@lesson.course, @lesson)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
    @lesson.destroy
    redirect_to course_path(@course)
  end

  private

  def lesson_params
    params.require('lesson').permit(:name, :content, :number)
  end
end
