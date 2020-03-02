
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string	:name,	          null:false
      t.integer	:price,	          null:false
      t.string  :brand
      t.text	  :description,	    null:false
      t.integer :condition_id,	  null:false
      t.integer :deriver_charge_id,	null:false
      t.integer :prefecture_id,	  null:false
      t.integer :deriver_date_id,	  null:false
      t.integer :soldout_or_exhibiting_id, default: 1
      t.timestamps
    end
  end
end