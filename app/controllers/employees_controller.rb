class EmployeesController < ApplicationController
  def create
    @company = Company.find(employee_params[:company_id])
    @area = Area.find(employee_params[:area_id])
    @employee = Employee.new(employee_params)
    @employee.company = @company
    @employee.area = @area
    if @employee.save
      redirect_to company_path(@company)
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :area_id, :company_id)
  end
end
