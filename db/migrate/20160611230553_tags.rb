class Tags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
