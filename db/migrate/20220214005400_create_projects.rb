class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :country
      t.string :stratum
      t.string :logo
      t.string :phone
      t.boolean :enabled, default: true
      t.string :sales_room_address
      t.string :sales_room_phone
      t.string :sales_room_email
      t.datetime :estimated_start_date
      t.datetime :estimated_end_date

      t.timestamps
    end
  end
end
