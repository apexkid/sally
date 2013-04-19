class CreateSketchs < ActiveRecord::Migration
  def self.up
    create_table :sketches do |t|
      t.string :occupation
      t.string :gender
      t.string :mobile
      t.text :interest
      t.text :about
      t.integer :user_id

      t.timestamps 
    end
  end
  def self.down
    drop_table :sketches
  end
end
