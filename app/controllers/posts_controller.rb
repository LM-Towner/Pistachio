class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |f|
      if(@post.save)
        f.html { redirect_to "/home", notice: "Post Created!" }
      else
        f.html { redirect_to "/home", notice: "Post did not save"}
      end
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
   @post.destroy if @post.user == current_user
   redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:content)
  end
end
