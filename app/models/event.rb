class Event < ActiveRecord::Base
  attr_accessible :description, :title, :selected_option_id, :options_attributes
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options, :allow_destroy => true
  belongs_to :selected_option, class_name: Option
end
