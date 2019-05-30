class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      article.update(article_params_update)
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.permit(:title, :text)
  end

  def article_params_update
    params.require(:article).permit(:title, :text)
  end
end
