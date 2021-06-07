#spec/features/articles/index_spec 

require "rails_helper"

RSpec.describe "Article index page" do
  describe "user visits /articles" do
    before :each do 
      @article_1 = Article.create!(title: "Title 1", body: "Body 1")
      @article_2 = Article.create!(title: "Title 2", body: "Body 2")
      visit '/articles'
    end 
    
    it "displays all articles" do

      expect(page).to have_link(@article_1.title)
      expect(page).to have_link(@article_2.title)
    end

    it "links to form to create new article" do

      expect(page).to have_link("Create a New Article")
    end
  end
end