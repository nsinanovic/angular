class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
