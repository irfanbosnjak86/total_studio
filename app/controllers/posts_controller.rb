class PostsController < ApplicationController
	before_action :find_posts, only: [:show, :edit, :update, :destroy]
	layout "blog"

	def index
		@posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
	end

	def show
	end

	def new
		@post = Post.new
		@post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		if @post.save 
			redirect_to @post, notice: "Uspesno kreiran post!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice: "Uspesno obrisan post!"
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :category_name, post_images_attributes: [ :caption, :id, :photo, :_destroy ])
	end

	def find_posts
		@post = Post.find(params[:id])
	end
end
