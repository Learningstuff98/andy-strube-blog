class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = current_post
  end

  def edit
    @post = current_post
  end

  def update
    post = current_post
    post.update(post_params)
    redirect_to post_path(post)
  end

  private

  def current_post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
