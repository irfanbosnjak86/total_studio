class Admin::PostsController < ApplicationController
  before_action :find_posts, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]
  skip_before_action :verify_authenticity_token
  layout "blog"

  
  def new
    @post =  current_admin.posts.build 
    @post.post_images.build
    @post.videos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def create
    
    @post = current_admin.posts.build(post_params)
     respond_to do |format|
      if @post.save
        format.html { redirect_to ([ :admin, @post ]) }
        format.js { j render '/admin/show'}
      else
        format.html { render action: "new" }
        format.json { render json: [:admin, @post.errors], status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to ([ :admin, @post ])
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to '/blog', notice: "Uspesno obrisan post!"
  end

  

  private

  def post_params
    params.require(:post).permit(:title, :description, :category_name, :datum, post_images_attributes: [ :caption, :id, :photo, :_destroy ], videos_attributes: [ :id, :title, :url, :description, :_destroy ])
  end

  def find_posts
    @post = Post.find(params[:id])
  end
end