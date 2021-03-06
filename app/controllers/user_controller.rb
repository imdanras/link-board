class UserController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash[:danger] = user.errors.messages.map do |key, value|
  		redirect_to user_index_path
      end
  	end
  end

  def show
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	
end
