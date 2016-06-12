class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  has_and_belongs_to_many :tag
  belongs_to :user
  accepts_nested_attributes_for :tag, :allow_destroy => false

  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end
end
