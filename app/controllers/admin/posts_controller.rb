class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_dashboard_path, notice: "Post updated!"
    else
      render :edit
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end

  def post_params
    params.require(:post).permit(:content, :active, :featured)
  end
end
