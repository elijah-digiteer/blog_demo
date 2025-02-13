class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def my_posts
      @posts = current_user.posts.order(created_at: :desc)
    end
  end
  