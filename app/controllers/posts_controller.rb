class PostsController < ApplicationController
  def index
    @posts = Post.all
    @cur_user = @current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_email = @current_user.email
    if @post.save
      redirect_to @post
    else
      flash.now.alert = "Post Not saved. Please repost it"
      render :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @cur_user = @current_user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

      if @post.update_attributes(params[:post])
        redirect_to @post, :notice => 'Successfully updated the post'
      else
        render :action => "edit"
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

end
