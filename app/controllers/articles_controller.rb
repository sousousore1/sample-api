class ArticlesController < ApplicationController
  def index
    articles = Sample::Core::Article.all
    render json: articles
  end

  def show
    article = Sample::Core::Article.find(params[:id])
    render json: article
  end
end
