class ArticlesController < ApplicationController
  def index
    articles = Sample::Core::Article.all
    render json: articles
  end
end
