class Doctor < ActiveRecord::Base
  belongs_to :specialty
  accepts_nested_attributes_for :specialty
  attr_accessible :name, :specialty_attributes

  def specialty_attributes=(specialty_attrs)
    s_id = specialty_attrs.delete(:id)
    if integer?(s_id)
      self.specialty = Specialty.find(s_id)
    else
      self.specialty = Specialty.new(name: s_id)
    end
  end

  private

  # THANKS to Sarah Mei [1].
  def integer?(value)
    value.to_i.to_s == value
  end

  # [1] http://stackoverflow.com/questions/1235863/test-if-a-string-is-basically-an-integer-in-quotes-using-ruby
end
