class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
    #@duck.student.build
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find_by_id(params[:id])
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  private

  def duck_params
    params.require(:duck).permit(
      :name,
      :description,
      student_attributes: [
        :name,
        :mod
      ]
    )
  end

end
