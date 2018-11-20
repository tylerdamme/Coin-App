class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :apikey

      t.timestamps
    end
  end
end
