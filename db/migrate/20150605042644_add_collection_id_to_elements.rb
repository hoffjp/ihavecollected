class AddCollectionIdToElements < ActiveRecord::Migration
  def change
    add_column :elements, :collection_id, :integer
  end
end
