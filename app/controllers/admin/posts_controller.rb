class Admin::PostsController < ApplicationController
  layout "admin"

  before_filter :valid_user
  
  def index
    @posts = current_user.posts.order("id DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      ProcessMarkdownWorker.perform_async(@post.id)

      redirect_to [:admin, @post]
    else 
      render action: :new
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.update_attributes(post_params)

    ProcessMarkdownWorker.perform_async(@post.id)

    redirect_to [:admin, @post]
  end

  def show
    @post ||= Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy

    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :markdown)
  end

  def valid_user
    redirect_to admin_sign_in_path unless logged_in?
  end
end
