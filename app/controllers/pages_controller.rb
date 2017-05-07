#This page controller contains all of the code for any page inside of /pages

class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost= Post.new
  end

  def profile
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found!"
    end
  end

  def explore
    @posts = Post.all
  end

end
