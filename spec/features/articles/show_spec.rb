require "rails_helper"
RSpec.describe "Article show page" do
  describe "user sees one article" do
    describe "they link from the articles index" do
      before :each do 
        @article = Article.create!(title: "New Title", body: "New Body")
      end
      it "displays information for one article" do
        visit articles_path
        click_link @article.title
  
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
      end
    end
  end
end