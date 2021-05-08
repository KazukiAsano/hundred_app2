class HomesController < ApplicationController
  def index
  end

  def map
    
    
    post_shop_list=Post.pluck(:shop_name).reject(&:blank?)
    review_shop_list=Review.pluck(:shop_name).reject(&:blank?)
    @shop_list=post_shop_list | review_shop_list
    
  end

end
