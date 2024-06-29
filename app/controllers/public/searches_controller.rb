class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
#      redirect_to search_path
  end
end
