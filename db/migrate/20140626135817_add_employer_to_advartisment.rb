class AddEmployerToAdvartisment < ActiveRecord::Migration
  def change
    add_column :advartisments, :employer, :string
  end
end
