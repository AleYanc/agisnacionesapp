class WorkingDay < ApplicationRecord
  belongs_to :employee

  def self.date_name(date)
    return 'Invalid date format. It should be DD-MM or MM-DD' unless date =~ /\d-\d/
    date_name = Date.parse(date.to_s).strftime("%A")
  end
end
