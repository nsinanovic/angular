class AddUserRefToCv < ActiveRecord::Migration
  def change
    add_reference :cvs, :user, index: true
  end
end
