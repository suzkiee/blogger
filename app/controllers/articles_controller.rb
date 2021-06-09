class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create 
    @article = Article.new(article_params)
    @article.save 
    
    redirec_to article_path(@article)
  end

  private 
    def article_params 
      params.require(:article).permit(:title, :body)
    end
end