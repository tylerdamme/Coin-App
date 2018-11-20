class ChangeTypeToTypeOfInTransaction < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :type
    add_column :transactions, :withdrawal, :boolean
  end
end
