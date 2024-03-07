class AddPublishedToLectures < ActiveRecord::Migration[7.1]
  def change
    add_column :lectures, :published, :boolean
  end
end
