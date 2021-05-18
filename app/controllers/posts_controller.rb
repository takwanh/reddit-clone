class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.community_id = params[:community_id]
    if @post.save
      redirect_to community_path(@post.community_id)
    else
      @community = Community.find(params[:community_id])
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end


end
