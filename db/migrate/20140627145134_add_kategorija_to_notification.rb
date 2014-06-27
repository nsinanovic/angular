class AddKategorijaToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :kategorija, :string
  end
end
