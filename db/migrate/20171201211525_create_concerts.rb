class CreateConcerts < ActiveRecord::Migration[5.1]
  def change
    create_table :concerts do |t|
      t.string :name
      t.datetime :date
      t.integer :duration
      t.decimal :cost, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
