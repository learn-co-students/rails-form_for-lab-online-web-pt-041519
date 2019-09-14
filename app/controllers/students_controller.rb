class StudentsController < ApplicationController
      def index
        @students = Student.all
      end
     
      def show
        @student = Student.find(params[:id])
      end
     
      def new
        @student = Student.new
      end
     
      def edit
        @student = Student.find(params[:id])
      end
     
      def create
        @student = Student.new(student_params)
     
        respond_to do |format|
          if @student.save
            format.html { redirect_to @student, notice: 'Class was successfully created.' }
            format.json { render :show, status: :created, location: @student }
          else
            format.html { render :new }
            format.json { render json: @student.errors, status: :unprocessable_entity }
          end
        end
      end
     
      def update
        @student = Student.find(params[:id])
        respond_to do |format|
          if @student.update(student_params)
            format.html { redirect_to @student, notice: 'Class was successfully updated.' }
            format.json { render :show, status: :ok, location: @student }
          else
            format.html { render :edit }
            format.json { render json: @student.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @student.destroy
        respond_to do |format|
          format.html { redirect_to school_classes_url, notice: 'Class was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
     
      private
        def set_class
          @student = Student.find(params[:id])
        end
     
        def student_params
          params.require(:student).permit(:first_name, :last_name)
        end
    
end
