class SchoolClassesController < ApplicationController

  def index
    @courses = SchoolClass.all
  end

  def new
    @course = SchoolClass.new
  end

  def create
    @course = SchoolClass.create(set_params(:title, :room_number))
    redirect_to school_class_path(@course)
  end

  def show
    set_course
  end

  def edit
    set_course
  end

  def update
    set_course
    @course.update(set_params(:title, :room_number))
    redirect_to school_class_path(@course)
  end


  ### HELPERS
  def set_course
    @course = SchoolClass.find(params[:id])
  end

  def set_params(*attributes)
    params.require(:school_class).permit(*attributes)
  end
end
