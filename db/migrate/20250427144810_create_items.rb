class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :genre_id, null: false # チャレンジ要素
      t.boolean :is_active, null: false # チャレンジ要素
      t.timestamps
    end
  end
end
