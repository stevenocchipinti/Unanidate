class Option < ActiveRecord::Base
  attr_accessible :datetime
  belongs_to :event

  validates_datetime :datetime

  def selected?
    return false unless event
    id == event.selected_option_id
  end

  def to_s
    datetime.strftime("%D @ %T")
  end

end
