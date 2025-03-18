class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
   
     if @user && BCrypt::Password.new(@user["password"]) == params["password"]
       session["user_id"] = @user.id
       flash["notice"] = "Login Successful"
       redirect_to "/places"
     else
       flash["notice"] = "Invalid Login Credentials. Please Try Again."
       redirect_to "/login"
     end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Logged Out."
    redirect_to "/login"
  end
end
  