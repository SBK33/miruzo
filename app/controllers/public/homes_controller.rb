class Public::HomesController < ApplicationController
  def top
    respond_to do |format|
      format.html do
        @post = Post.page(params[:page])
      end
      format.json do
        @post = Post.all
      end
    end
  end

  def about
  end
end
