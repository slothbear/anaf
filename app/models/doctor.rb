class Doctor < ActiveRecord::Base
  belongs_to :specialty
  accepts_nested_attributes_for :specialty
  attr_accessible :name, :specialty_attributes
end
