class CreateKategorijas < ActiveRecord::Migration
  def change
    create_table :kategorijas do |t|
      t.string :title

      t.timestamps
    end
  end
end
