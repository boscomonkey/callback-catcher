class AddHeadersToAccesses < ActiveRecord::Migration
  def change
    add_column :accesses, :headers, :text
  end
end
