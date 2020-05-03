class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

  def new
    
  end
  
  
  def create
    
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  private

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description)
  end
  

end