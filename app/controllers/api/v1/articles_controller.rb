class Api::V1::ArticlesController < ApplicationController

  def index
    order = params[:order].presence ? (params[:order] == "asc" ? :asc : :desc) : :desc
    articles = Article.published(order)

    render json: articles
  end

  def show
    id = params[:id]
    article = Article.published.where(id: id)

    render json: article
  end
end
