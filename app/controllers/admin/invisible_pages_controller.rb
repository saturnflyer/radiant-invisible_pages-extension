class Admin::InvisiblePagesController < ApplicationController
  def index
    @invisible_pages = InvisiblePage.find(:all)
  end
end