class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end


  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users
  def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to '/'
  else
    redirect_to '/new'
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
