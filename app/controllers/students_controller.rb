class StudentsController <ApplicationController
    def create
        @student = Student.new(params.require(:student).permit(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
    end 
    
    def new
        @student = Student.new
    end 
    
    def index 
        @students = Student.all
    end
    
    def edit 
        @student = Student.find(params[:id])
    end
    
    def update
        @student = Student.find(params[:id])
        @student.update(student_params(:first_name, :last_name))
        redirect_to @student
    end
    
    def show
        @student = Student.find(params[:id])
    end    

    private
	   
	def student_params(*args)
	  params.require(:student).permit(*args)
	end
end    