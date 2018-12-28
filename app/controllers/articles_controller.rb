class ArticlesController < ApplicationController
  def index
    @articles = Sample::Core::Article.all
  end
end
