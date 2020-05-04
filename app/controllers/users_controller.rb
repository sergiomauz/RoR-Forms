class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # @user.email = params[:email]
    # @user.username = params[:username]
    # @user.password = params[:password]

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    updated_user = user_params

    updated_user[:password] = @user[:password] if updated_user[:password].empty?

    if @user.update(updated_user)
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
