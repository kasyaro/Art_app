class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.string :title
      t.string :img
      t.text :description
      t.string :size
      t.string :style
      t.string :medium
      t.string :material

      t.timestamps
    end
  end
end
