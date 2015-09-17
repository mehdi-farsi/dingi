class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :name
      t.text :definition

      t.timestamps null: false
    end
  end
end
