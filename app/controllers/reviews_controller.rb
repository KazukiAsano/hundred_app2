class ReviewsController < ApplicationController
  before_action :set_post, except: [:edit,:update]
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review=Review.new(review_params)
    if @review.save
      redirect_to posts_path,notice: "口コミ投稿を完了しました。"
    else
      redirect_to new_post_reviews_path(@post),alert: "すでに口コミは投稿されています。"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_edit_params)
      redirect_to posts_path,notice: "口コミ編集を完了しました。"
    else
      render :edit,alert: "内容に不備があります。確認してもう一度送信してください。"
    end
  end

  def destroy
    @review=Review.find_by(user_id: current_user.id, post_id: @post.id)
    @review.destroy!
    redirect_to posts_path, alert: "口コミを削除しました。"
  end

  private 
  
  def review_params
    params.require(:review).permit(:title,:comment,:rate,:shop_name).merge(user_id:current_user.id,post_id:@post.id)
  end

  def review_edit_params
    params.require(:review).permit(:title,:comment,:rate,:shop_name)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
