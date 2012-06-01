class Event < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :options
  belongs_to :selected_option, class_name: Option
end
