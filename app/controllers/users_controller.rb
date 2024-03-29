class UsersController < ApplicationController
  def new  
    @user = User.new  
  end  
  
  def edit  
    @user = current_user
  end
  
  def create  
    @user = User.new(params[:user])  
    if @user.save
      sign_in @user
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"
    end  
  end
end
