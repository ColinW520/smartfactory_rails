class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :names
      t.references :brand, index: true

      t.timestamps
    end
  end
end
