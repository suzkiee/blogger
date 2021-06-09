#spec/features/articles/edit_spec 

require "rails_helper"

RSpec.describe "Article edit page" do
  describe 'display' do 
    describe "user can edit existing article" do
      it "edits article" do
        article = Article.create!(title: "This Title!", body: "This Body!")
        visit article_path(article)
      
        expect(page).to have_content("This Title!")
        expect(page).to have_content("This Body!")
      
        click_link "Edit"

        # expect(current_path).to eq("/articles/#{article.id}/edit")
        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[title]", with: "Change Title!"
        fill_in "article[body]",  with: "Change Body!"
        click_on "Update Article"
        
        expect(page).to have_content("Change Title!")
        expect(page).to have_content("Change Body!")
        expect(page).to have_content("Article was updated!")
      end
    end
  end
end