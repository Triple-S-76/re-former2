class UsersController < ApplicationController

  def new
    p 'USERS NEW JUST RAN'
    @user = User.new
  end

  def create
    p 'USERS CREATE JUST RAN'
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    p 'USER PARAMS JUST RAN'
    params.require(:user).permit(:username, :email, :password)
  end
end
