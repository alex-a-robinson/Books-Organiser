class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :desc))
      redirect_to @post
    else
      render "edit"
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :desc)
    end

end
