class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end
  
  
  def create

    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description)
  end
  

end