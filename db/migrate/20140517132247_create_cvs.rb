class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.string :naslov
      t.string :dodatno

      t.timestamps
    end
  end
end
