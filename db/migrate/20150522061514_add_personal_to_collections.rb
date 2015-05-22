class AddPersonalToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :personal, :bool, default: true
  end
end
