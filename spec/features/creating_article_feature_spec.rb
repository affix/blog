require 'rspec'
require 'rails_helper'

RSpec.feature "Performing Actions on Articles" do
  before do
    # Create a bunch of articles
    10.times do |i|
      create(:article, title: "Article #{i}", body: "Body #{i}")
    end
  end

  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"

    fill_in "Title", with: "Creating an article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")
    expect(page.current_path).to eq(article_path(Article.last))
  end

  scenario "A user can delete an Article" do
    @article = create(:article)
    visit "/"
    click_link "Destroy #{@article.id}"
    expect(page).not_to have_content(@article.body)
  end

  scenario "A user can visit a specific article" do
    @article = create(:article)
    visit "/"
    click_link @article.title
    expect(page.current_path).to eq(article_path(@article.id))
  end

  scenario "A user can edit a post" do
    count = Article.count
    visit "/"
    click_link "Edit #{Article.first.title}"
    fill_in "Title", with: "Creating an article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"
    expect(Article.count).to eq(count)
    expect(page).to have_content("Lorem Ipsum")
  end

end
