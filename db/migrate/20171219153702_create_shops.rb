class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :chain
      t.string :name
      t.decimal :latitude, :precision => 16, :scale => 14
      t.decimal :longitude, :precision => 17, :scale => 14
      t.string :address
      t.string :city
      t.integer :zip
      t.string :phone
      t.string :country_code

      t.timestamps
    end
  end
end
