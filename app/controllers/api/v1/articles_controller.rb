class Api::V1::ArticlesController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    order = params[:order].presence ? (params[:order] == "asc" ? :asc : :desc) : :desc
    articles = Article.published(order)

    articles_with_images = articles.map do |article|
      article.as_json.merge(image_url: article.image.attached? ? url_for(article.image) : nil)
    end

    render json: articles_with_images
  end

  def show
    id = params[:id]
    article = Article.published.where(id: id)

    article_with_image = article.as_json.merge(image_url: article.image.attached? ? url_for(article.image) : nil)

    render json: article_with_image
  end
end
