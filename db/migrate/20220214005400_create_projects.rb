class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :country
      t.string :logo
      t.string :phone
      t.boolean :enabled
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
