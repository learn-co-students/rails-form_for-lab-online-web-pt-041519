class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(set_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  def show
    set_student
  end

  def edit
    set_student
  end

  def update
    set_student
    @student.update(set_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end


  ### HELPERS
  def set_student
    @student = Student.find(params[:id])
  end

  def set_params(*attributes)
    params.require(:student).permit(*attributes)
  end

end
