class UsersController < ApplicationController
  before_action :authenticate, :only => [:edit, :update, :show]
  before_action :correct_user, :only => [:edit, :update, :show]
 
  def new
    @title = "Sign up"
    @user = User.new
  end
 
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end    
  
  def create
   @user = User.new(params[:user])
   
   if @user.save
     sign_in @user
     flash[:success] = "Signed in to CoderClub!"
     redirect_to @user
   else
     @title = "Sign up"
     render 'new'
   end
 end
 def edit
   @user = User.find(params[:id])
   # we know that @user is the current_user b/c of the before_filter
   @title = "Edit user"
 end
 def update
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated."
     redirect_to @user
   else
     @title = "Edit user"
     render 'edit'
   end
 end
  
  private 
  def authenticate
    deny_access unless signed_in? 
  end
 
  def correct_user
    @user = User.find(params[:id])
    redirect_to(index_path) unless current_user?(@user) || current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
