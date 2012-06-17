class Option < ActiveRecord::Base
  attr_accessible :datetime
  belongs_to :event

  validates_datetime :datetime

  def selected?
    return false unless event
    id == event.selected_option_id
  end

  def to_s
    datetime.strftime("%A %-d %B @ %l:%M %p")
  end

  def date
    datetime.strftime("%A %-d %B")
  end

  def time
    datetime.strftime("%l:%M %p")
  end

end
