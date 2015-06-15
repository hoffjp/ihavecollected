class AddNameToElements < ActiveRecord::Migration
  def change
    add_column :elements, :name, :string
  end
end
