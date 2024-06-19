class UsersController < ApplicationController

  def new
    p 'USERS NEW JUST RAN'
  end

  def create
    p 'USERS CREATE JUST RAN'
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    # @user = User.new(user_params)
    p 123
    p @user
    p @user.username
    p @user.email
    p @user.password
    p 456

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    p 'USER PARAMS JUST RAN'
    params.require(:user).permit(:username, :email, :password)
  end
end
