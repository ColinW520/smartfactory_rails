class FixFramesNamesColumn < ActiveRecord::Migration
  def change
  	rename_column :frames, :names, :name
  end
end
