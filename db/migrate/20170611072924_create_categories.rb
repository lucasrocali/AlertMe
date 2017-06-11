class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image_url
      t.references :parent, index: true

      t.timestamps
    end
  end
end
