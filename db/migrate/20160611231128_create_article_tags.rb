class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article, index: true
      t.belongs_to :tag, index: true
    end
  end

  def down
    drop_table :articles_tags
  end
end
