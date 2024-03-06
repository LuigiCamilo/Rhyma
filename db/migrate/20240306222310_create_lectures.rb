class CreateLectures < ActiveRecord::Migration[7.1]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.integer :lecture
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
