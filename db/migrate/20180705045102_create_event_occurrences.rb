class CreateEventOccurrences < ActiveRecord::Migration[5.2]
  def self.up
    create_table :event_occurrences do |t|

      t.references :schedulable, polymorphic: true
      t.datetime :date

      t.timestamps

    end
  end

  def self.down
    drop_table :event_occurrences
  end
end
