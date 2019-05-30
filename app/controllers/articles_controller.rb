class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def new
  end

  def create
    @article = Article.create(title: article_params[:title], text: article_params[:text], user_id: current_user.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
