class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.string :name
      t.string :description
      t.datetime :date_create
      t.datetime :date_full
      t.string :priority
      t.integer :taskfull

      t.timestamps
    end
  end
end
