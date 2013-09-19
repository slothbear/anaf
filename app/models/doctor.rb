class Doctor < ActiveRecord::Base
  belongs_to :specialty
  accepts_nested_attributes_for :specialty
  attr_accessible :name, :specialty_attributes

  # id cannot be mass-assigned, so the record must be found manually.
  # http://stackoverflow.com/questions/9864501/recordnotfound-with-accepts-nested-attributes-for-and-belongs-to

  # If the koenpunt/chosen select menu has created a new option, the text is
  # located in the 'id' param. Move it to 'name' so accepts_nested_attributes_for
  # can create the record and association if everything suceeds.

  def specialty_attributes=(attrs)
    self.specialty =
      Specialty.find_by_id(attrs[:id]) ||
      Specialty.new(name: attrs[:id])
  end

end
