class Public::PostsController < ApplicationController
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
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
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
end
