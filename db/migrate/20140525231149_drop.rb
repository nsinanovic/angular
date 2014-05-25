class Drop < ActiveRecord::Migration
  def change
    drop_table :kategorijas
  end
end
