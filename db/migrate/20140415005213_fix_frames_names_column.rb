class FixFramesNamesColumn < ActiveRecord::Migration
  def change
  	rename_column :Frames, :names, :name
  end
end
