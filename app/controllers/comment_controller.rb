class CommentController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.create({content:params[:comment][:content],post_id:params[:post_id],user_id:current_user.id})
    redirect_to post_path(params[:post_id])
  end
end
