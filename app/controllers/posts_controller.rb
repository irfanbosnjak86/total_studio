class PostsController < ApplicationController
  before_action :find_posts, only: [:show, :edit, :update, :destroy]
  layout "blog"

  def index
    if params[:category_name]
      @posts = Post.where(:category_name => params[:category_name]).order("created_at DESC").page(params[:page]).per(3)
    else
      @posts = Post.all.order("created_at DESC").page(params[:page]).per(3)
    end
  end

  def show
  end
  
  def post_params
    params.require(:post).permit(:title, :description, :category_name, post_images_attributes: [ :caption, :id, :photo, :_destroy ], videos_attributes: [ :id, :title, :url, :description, :_destroy ])
  end

  def find_posts
    @post = Post.find(params[:id])
  end
end
