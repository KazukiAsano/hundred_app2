class ShoppingsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create 
    @shopping = Shopping.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    @shopping = Shopping.find_by(user_id: current_user.id, post_id: @post.id)
    @shopping.destroy
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
