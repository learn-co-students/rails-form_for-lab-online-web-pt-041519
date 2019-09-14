class SchoolClassesController < ApplicationController
 
  def index
    @schoolclass = SchoolClass.all
  end
 
  def show
    @schoolclass = SchoolClass.find(params[:id])
  end
 
  def new
    @schoolclass = SchoolClass.new
  end
 
  def edit
    @schoolclass = SchoolClass.find(params[:id])
  end
 
  def create
    @schoolclass = SchoolClass.new(class_params)
 
    respond_to do |format|
      if @schoolclass.save
        format.html { redirect_to @schoolclass, notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @schoolclass }
      else
        format.html { render :new }
        format.json { render json: @schoolclass.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    @schoolclass = SchoolClass.find(params[:id])
    respond_to do |format|
      if @schoolclass.update(class_params)
        format.html { redirect_to @schoolclass, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @schoolclass }
      else
        format.html { render :edit }
        format.json { render json: @schoolclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schoolclass.destroy
    respond_to do |format|
      format.html { redirect_to school_classes_url, notice: 'Class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
 
    def class_params
      params.require(:school_class).permit(:title, :room_number)
    end
end
