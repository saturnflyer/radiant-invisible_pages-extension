class Admin::InvisiblePagesController < ApplicationController
  def index
    @invisible_pages = Page.find(:all, :conditions => ['invisible = ?', true])
  end
end