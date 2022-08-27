class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: (EmployeeRepresenter.new(@employee).as_json).merge(msg: 'Employee created')
    else
      render json: @employee.errors
    end
  end

  def show
    render json: EmployeeRepresenter.new(@employee).as_json
  end

  private
  def set_employee 
    begin
      @employee = Employee.find_by(file_number: params[:file_number])
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'Could not find employee'}
    end
  end

  def employee_params
    params.permit(:name, :file_number)
  end
end