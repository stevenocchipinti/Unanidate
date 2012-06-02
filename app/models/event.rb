class Event < ActiveRecord::Base
  attr_accessible :description, :title, :options_attributes
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options
  belongs_to :selected_option, class_name: Option
end
