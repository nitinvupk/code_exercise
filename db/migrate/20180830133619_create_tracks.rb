class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :surface_type
      t.string :time_zone

      t.timestamps
    end
  end
end
