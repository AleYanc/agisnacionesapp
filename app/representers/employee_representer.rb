class EmployeeRepresenter
  def initialize(employee)
    @employee = employee
  end

  def as_json
    {
      name: employee.name,
      file_number: employee.file_number,
      working_days:
      begin
        employee.working_days.map do |working_day|
          {
            day: working_day.day,
            date: working_day.date,
            type: working_day.day_type
          }
        end
      end
    }
  end

  private
  attr_reader :employee
end