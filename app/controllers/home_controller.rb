class HomeController < ApplicationController
  def index
    @posts = Post.all.order("id DESC")
  end
end
