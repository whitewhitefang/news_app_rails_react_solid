class HomepageController < ApplicationController
  def index
  end

  def no_page
    render html: '404, no such page'
  end
end
