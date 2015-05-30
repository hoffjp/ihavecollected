class AddDefaultValueToPersonal < ActiveRecord::Migration
  def up
    change_column :collections, :personal, :boolean, :default => true
end

def down
  change_column :collections, :personal, :boolean, :default => nil
end
end
