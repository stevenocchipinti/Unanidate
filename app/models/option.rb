class Option < ActiveRecord::Base
  attr_accessible :datetime
  belongs_to :event

  validates_datetime :datetime

  def to_s
    datetime.strftime("%D @ %T")
  end

end
