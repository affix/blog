require 'rspec'
require 'rails_helper'

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit "/"

    click_link "new article"

    fill_in "Title", with: "Creating an article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"

    expect(page).to have_content("Post saved!")
    expect(page.current_path).to eq(articles_path)
  end
end
