class StudentsController < ApplicationController
  # require 'pry'
  def index
    @students = Student.all
  end

def new
    @students = Student.new
  end
  def edit
    @students = Student.find(params[:id])
  end
def update
  @students =Student.find(params[:id])
  if @students.update(student_params)
    redirect_to students_path
  else
    render :edit
  end
end


  def create
    @students = Student.new(student_params)
    if @students.save
      redirect_to students_path

    else
      render :new
    end
  end
  def show

    # binding.pry

    @students = Student.find(params[:id])
  end
  private

  def student_params
     params.require(:student).permit(:first_name, :last_name, :email)
  end
end
