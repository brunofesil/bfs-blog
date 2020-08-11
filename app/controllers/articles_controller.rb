class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def show
  end

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end
    
  
  def create

    @article = Article.new(article_params)
    @article.user = User.last
    if @article.save
      flash[:notice] = "Article was successfully created."
      #another way to redirect
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      #the basic way to redirect is using prefixes
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end