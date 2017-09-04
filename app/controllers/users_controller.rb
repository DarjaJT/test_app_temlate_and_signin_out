class UsersController < ApplicationController


  def new # add new user
    @user = User.new
  end

  def show # show user profile
    @user = User.find(params[:id])
  end

  def create # registration form processing
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the App!" # temporary messages (application.html.erb)
      redirect_to @user
    else # failure to register
      render 'new'
    end
  end



  private

  def user_params # parameters are required
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
