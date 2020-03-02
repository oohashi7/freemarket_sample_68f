class CreateStreetAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :street_addresses do |t|
      t.string       :first_name,       null:false
      t.string       :first_name_kana,  null:false
      t.string       :last_name,        null:false
      t.string       :last_name_kana,   null:false
      t.string       :city,             null:false
      t.string       :address,          null:false
      t.string       :building
      t.integer      :zipcode,          null:false
      t.integer      :telephone
      t.integer      :prefecture_id,    null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
