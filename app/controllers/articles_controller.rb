class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
  end

  def create
    @article = Article.create(title: article_params[:title], text: article_params[:text], user_id: current_user.id)
  end

  private

  def article_params
    params.permit(title:, :text)
  end
end
