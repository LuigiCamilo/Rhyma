class RemoveFieldsFromLecture < ActiveRecord::Migration[7.1]
  def change
    remove_column :lectures, :subtitle, :string
  end
end
