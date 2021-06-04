class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def posts
    @posts = Post.where(user_id: current_user.id)
  end

  def shoppings
    shoppings = Shopping.where(user_id: current_user.id).pluck(:post_id)
    @shopping_list = Post.find(shoppings) 
  end

  def reviews
    reviews = Review.where(user_id: current_user.id).pluck(:post_id)
    @review_list = Post.find(reviews)
  end

  private
  def set_user
    @user=User.find(current_user.id)
  end

end
