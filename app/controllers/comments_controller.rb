class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    respond_to do |format|
      format.js {
        if @comment.save
          @comments = Comment.where(post_id: @comment.post_id)
          render "comments/create"
        else
          render "comments/error" 
        end
      }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js {
        if @comment.destroy
          render "comments/destroy"
        else
          render "comments/error"
        end
      }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js {
        if @comment.update(comment_params)
          @comments = Comment.where(post_id: @comment.post_id)
          render "comments/update"
        else
          render "comments/error"
        end
      }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private
  
    def comment_params
      params.require(:comment).permit(:message, :post_id)
    end

    def correct_user
      @comment = Comment.find(params[:id])
      redirect_to root_path unless @comment.user_id == current_user.id
    end

end
