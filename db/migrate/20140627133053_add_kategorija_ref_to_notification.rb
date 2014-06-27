class AddKategorijaRefToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :kategorija, index: true
  end
end
