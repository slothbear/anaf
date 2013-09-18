class Doctor < ActiveRecord::Base
  belongs_to :specialty
  attr_accessible :name
end
