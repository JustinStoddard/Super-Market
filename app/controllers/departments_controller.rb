class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)

      if @department.save
        redirect_to departments_path(@department)
      else
        render :new
      end
  end

  def update
    @department = Department.find(params[:id])

      if @department.update(department_params)
        redirect_to departments_path(@department)
      else
        render :edit
      end
  end

  def destroy
    Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end
