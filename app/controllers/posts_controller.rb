class PostsController < ApplicationController
  
  def index
    @posts=Post.all
    @posts_page=Post.page(params[:page]).per(4)
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path,notice: "新規投稿を完了しました。"
    else
      render :new,alert: "内容に不備があります。確認してもう一度送信してください。"
    end
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path,notice: "投稿の編集を完了しました。"
    else
      render :edit,alert: "内容に不備があります。確認してもう一度送信してください。"
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path, alert: "投稿を削除しました。"
  end

  def reviews
    @post=Post.find(params[:id])
    @reviews=Review.where(post_id:@post.id)
  end

  def ranking
    # @ranks=Post.all.sort {|a,b| b.reviews.average(:rate).to_f.round(1) <=> a.reviews.average(:rate).to_f.round(1) }
    @ranks=Post.find(Review.group(:post_id).order('avg(rate) desc').pluck(:post_id))
    # @ranks=Post.find(Review.group(:post_id).order('average_rate desc').average(:rate).pluck(:post_id))
    # score: <%= @post.reviews.average(:rate).to_f.round(1) %>
    
  end

  private 
  
  def post_params
    params.require(:post).permit(:name,:comment,:genre,:shop_name,:rate,:genre,:image,:purchase_num).merge(user_id:current_user.id)
  end

end
