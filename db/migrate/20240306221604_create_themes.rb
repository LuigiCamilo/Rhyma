class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes do |t|
      t.string :title

      t.timestamps
    end
  end
end
