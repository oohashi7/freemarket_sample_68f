class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string ,             null:false
    add_column :users, :first_name, :string ,           null:false
    add_column :users, :first_name_kana, :string ,      null:false
    add_column :users, :last_name, :string ,            null:false
    add_column :users, :last_name_kana, :string ,       null:false
    
    add_column :users, :password, :string ,             null:false
    add_column :users, :confirmation_password,:string , null:false        
    # add_column :users, :prefecture, :references,     foreign_key: true
    add_column :users, :city, :string ,                 null:false
    add_column :users, :adress, :string ,               null:false
    add_column :users, :building , :string
    add_column :users, :zip_code, :integer ,            null:false
    add_column :users, :introduction , :text
    add_column :users, :birth_year, :integer ,          null:false
    add_column :users, :birth_month, :integer ,         null:false
    add_column :users, :birth_day, :integer ,           null:false
    add_column :users, :user_icon , :text
    add_column :users, :point_amount , :integer
    add_column :users, :profit_amount,  :integer 
  end
end
