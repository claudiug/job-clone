class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :media_item

      t.timestamps null: false
    end
  end
end
