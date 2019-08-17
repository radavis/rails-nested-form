class CreateDriversLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers_licenses do |t|
      t.references :person, foreign_key: true
      t.string :state
      t.string :drivers_license_number, null: false
      t.date :expires_on

      t.timestamps
    end
  end
end
