class AddUserIdToArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.belongs_to :user
    end
  end
end
