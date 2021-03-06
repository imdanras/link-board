class PostsController < ApplicationController
	before_action :is_authenticated, only: [:new]

  def index
  	@post = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
 	@post.user_id = current_user.id
  	if @post.save
  		session[:post_id] = @post.id
  		redirect_to root_path
  	else
  		render json: @post.errors.messages
  	end
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link, :user_id)
  end
end
