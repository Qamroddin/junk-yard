class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
   if @post.update_attributes(:title=>params[:post][:title],:text=>params[:post][:text])
     redirect_to posts_path
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post)
  end
end
