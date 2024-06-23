class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    respond_to do |format|
      format.html do
        @posts = Post.all
        #page(params[:page])
      end
      #ページネーション設定していないから上記記述不要か？
      format.json do
        @posts = Post.all
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You have created post successfully."
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated post successfully."
      redirect_to post_path(@post.id)
    else
      render :edit
    end

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:observed_at, :name, :note, :image,:address)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end
