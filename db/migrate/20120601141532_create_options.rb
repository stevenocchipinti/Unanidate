class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.datetime :datetime
      t.references :event

      t.timestamps
    end
    add_index :options, :event_id
  end
end
