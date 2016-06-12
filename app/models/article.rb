class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  has_and_belongs_to_many :tag
  belongs_to :user
end
