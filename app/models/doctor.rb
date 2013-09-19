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
    selected_specialty = attrs[:id]
    if integer?(selected_specialty)
      self.specialty = Specialty.find(selected_specialty)
    else
      self.specialty = Specialty.new(name: selected_specialty)
    end
  end

  private

  # THANKS to Sarah Mei [1].
  def integer?(value)
    value.to_i.to_s == value
  end

  # [1] http://stackoverflow.com/questions/1235863/test-if-a-string-is-basically-an-integer-in-quotes-using-ruby
end
