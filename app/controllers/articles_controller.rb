class ArticlesController < ApplicationController
  before_filter :require_login, only: [:create, :destroy, :edit, :update]

  def require_login
    unless current_user
      redirect_to root_path
      return false
    end
  end

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id    
  end
  def new
    @article = Article.new    
  end
  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created!"
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    
    @article.destroy


    flash.notice = "Article '#{@article.title}' deleted!"
    redirect_to articles_path
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"
    
    redirect_to article_path(@article)
  end

private
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
