class CreateMybooks < ActiveRecord::Migration
  def change
    create_table :mybooks do |t|
      t.string :name
      t.date :when
      t.time :intime
      t.text :wish

      t.timestamps
    end
  end
end
