class AddPublishedToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :published, :boolean
  end
end
