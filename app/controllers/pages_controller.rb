#This page controller contains all of the code for any page inside of /pages

class PagesController < ApplicationController
  def index
  end

  def home
  end

  def profile
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found!"
    end
  end

  def explore
  end

end
