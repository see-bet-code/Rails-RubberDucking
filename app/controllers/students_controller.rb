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

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    @student.ducks.build(student_id: @student.id)
  end

  def update
    @student = Student.find_by_id(params[:id])
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :name,
      :mod,
      duck_attributes: [
        :name,
        :description
      ]
    )
  end

end
