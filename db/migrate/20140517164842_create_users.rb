class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :lastname
      t.string :address
      t.string :phone
      t.string :username

      t.timestamps
    end
  end
end
