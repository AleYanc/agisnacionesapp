class WorkingDayRepresenter
  def initialize(working_day)
    @working_day = working_day
  end

  def as_json
    {
      date: working_day.date,
      day: working_day.day,
      time: working_day.time,
      day_type: working_day.day_type,
      employee: working_day.employee.file_number
    }
  end

  private
  attr_reader :working_day
end