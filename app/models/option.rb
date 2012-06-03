class Option < ActiveRecord::Base
  attr_accessible :datetime
  belongs_to :event

  def to_s
    datetime.strftime("%D @ %T")
  end
end
