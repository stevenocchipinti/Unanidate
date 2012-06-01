class Option < ActiveRecord::Base
  attr_accessible :datetime
  belongs_to :event
end
