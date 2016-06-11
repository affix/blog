require 'rspec'
require 'rails_helper'

RSpec.feature "Performing Actions on Articles" do
  before do
    # Create a bunch of articles
    10.times do |i|
      create(:article, title: "Article #{i}", body: "Body #{i}")
    end
  end

  scenario "A user can visit a specific article" do
    @article = create(:article)
    visit "/"
    click_link @article.title
    expect(page.current_path).to eq(article_path(@article.id))
  end

end
