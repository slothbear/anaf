class Doctor < ActiveRecord::Base
  belongs_to :specialty
  accepts_nested_attributes_for :specialty
  attr_accessible :name, :specialty_attributes

  def specialty_attributes=(specialty_attrs)
    self.specialty = Specialty.find_or_initialize_by_id(specialty_attrs.delete(:id))
    self.specialty.attributes = specialty_attrs
  end
end
