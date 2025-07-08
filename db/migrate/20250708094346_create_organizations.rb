class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :phone_number
      t.text :address
      t.text :homepage

      t.timestamps
    end
  end
end
