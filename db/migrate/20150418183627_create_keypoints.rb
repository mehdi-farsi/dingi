class CreateKeypoints < ActiveRecord::Migration
  def change
    create_table :keypoints do |t|
      t.text :content
      t.references :concept, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
