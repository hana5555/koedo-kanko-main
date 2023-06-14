class RemoveIsDisplayedFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :name, :boolean
  end
end
