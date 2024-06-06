class Public::HomesController < ApplicationController
  def top
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

  def about
  end
end
