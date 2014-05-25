class AddColumnToCv < ActiveRecord::Migration
  def change
    add_column :cvs, :radnoIskustvo, :string
    add_index :cvs, :radnoIskustvo
    add_column :cvs, :strucnaSprema, :string
    add_index :cvs, :strucnaSprema
    add_column :cvs, :obrazovanje, :string
    add_index :cvs, :obrazovanje
    add_column :cvs, :jezici, :string
    add_index :cvs, :jezici
    add_column :cvs, :vjestine, :string
    add_index :cvs, :vjestine
    add_column :cvs, :ostaleInformacije, :string
    add_index :cvs, :ostaleInformacije
  end
end
