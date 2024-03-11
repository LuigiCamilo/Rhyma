class RemoveFieldsFromCourse < ActiveRecord::Migration[7.1]
  def change
    remove_column :courses, :subtitle, :string
    remove_column :courses, :short_description, :string
  end
end
