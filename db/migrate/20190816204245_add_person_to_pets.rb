class AddPersonToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :person, foreign_key: true
  end
end
