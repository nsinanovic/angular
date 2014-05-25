class RemovePartNumberFromProducts < ActiveRecord::Migration
  def change
    remove_index :cvs, :radnoIskustvo
    remove_index :cvs, :strucnaSprema
    remove_index :cvs, :obrazovanje
    remove_index :cvs, :jezici
    remove_index :cvs, :vjestine
    remove_index :cvs, :ostaleInformacije
  end
end
