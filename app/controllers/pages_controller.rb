#This page controller contains all of the code for any page inside of /pages

class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost= Post.new
    following = []
    for @following in current_user.following do
      following.push(@following.id)
    end
  end

  def profile
    @posts = (User.find_by_username(params[:id])).posts
    @newPost = Post.new

    @toFollow = User.all.last(5)
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found!"
    end
    @followers = current_user.passive_relationships
  end

  def explore
    @posts = Post.all
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end

end
