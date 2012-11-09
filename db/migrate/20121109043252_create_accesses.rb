class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.text :payload

      t.timestamps
    end

    add_index :accesses, :created_at
  end
end
