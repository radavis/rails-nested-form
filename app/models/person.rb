class Person < ApplicationRecord
  has_many :pets
  accepts_nested_attributes_for :pets

  has_one :drivers_license
  accepts_nested_attributes_for :drivers_license
end
