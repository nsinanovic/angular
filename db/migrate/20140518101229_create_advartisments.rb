class CreateAdvartisments < ActiveRecord::Migration
  def change
    create_table :advartisments do |t|
      t.string :title
      t.text :description
      t.date :published
      t.date :expire
      t.string :location
      t.string :category


      t.timestamps
    end
  end
end
