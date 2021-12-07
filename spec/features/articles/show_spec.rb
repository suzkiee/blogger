# spec/features/articles/show_spec
require "rails_helper"

RSpec.describe "Article show page" do
  describe "display" do
    describe "user sees one article" do
      describe "they link from the articles index" do
        before :each do 
          @article = Article.create!(title: "New Title", body: "New Body")
          @comment_1 = @article.comments.create(author_name: "Me", body: "Commently comments")
          @comment_2 = @article.comments.create(author_name: "You", body: "So much to say")
        end

        it "displays information for one article" do
          visit articles_path
          click_link @article.title
  
          expect(page).to have_content(@article.title)
          expect(page).to have_content(@article.body)
          expect(page).to have_content(@comment_1.author_name)
          expect(page).to have_content(@comment_1.body)
          expect(page).to have_content(@comment_2.author_name)
          expect(page).to have_content(@comment_2.body)
        end
      end
    end
  end
end
