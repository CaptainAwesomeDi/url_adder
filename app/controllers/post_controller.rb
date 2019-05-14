class PostController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post= current_user.post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id:@post.id)
  end

  private
  def post_params
    params.require(:post).permit(:title,:url)
  end
end
