class WorkingDaysController < ApplicationController
  before_action :set_working_day, only: [:update, :destroy]

  def create
    @working_day = WorkingDay.new(working_day_params)
    @working_day.day = WorkingDay.date_name(params[:date])

    if @working_day.save
      render json: WorkingDayRepresenter.new(@working_day).as_json
    else
      render json: @working_day.errors, status: :unprocessable_entity
    end
  end

  def update
    @working_day.time = nil if @working_day.day_type == 'off'

    if @working_day.update(working_day_params) 
      render json: (WorkingDayRepresenter.new(@working_day).as_json).merge(msg: 'Working day updated')
    else
      render json: @working_day.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @working_day.destroy!
      render json: {message: 'Working day deleted'}
    else
      render json: @working_day.errors, status: :unprocessable_entity
    end

  end

  private

  def set_working_day
    @working_day = WorkingDay.find(params[:id])
  end

  def working_day_params
    params.permit(:date, :employee_id, :day_type)
  end
end