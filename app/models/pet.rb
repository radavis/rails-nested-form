class Pet < ApplicationRecord
  ANIMAL_TYPES = [
    'rabbit',
    'cat',
    'dog',
    'bear'
  ]
  
  belongs_to :person
end
