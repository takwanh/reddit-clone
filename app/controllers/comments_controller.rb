class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      format.js {
        if @comment.save
          @comments = Comment.where(post_id: @comment.post_id)
          render "comments/create"
        else
        end
      }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      respond_to do |format|
        format.js {
          if @comment.destroy
            render "comments/destroy"
          else
          end
        }
      end
    else
      redirect_to root_path, alert: "他人のコメントを消さないで！"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      respond_to do |format|
        format.js {
          if @comment.update(comment_params)
            @comments = Comment.where(post_id: @comment.post_id)
            render "comments/update"
          else
          end
        }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private
  
    def comment_params
      params.require(:comment).permit(:message, :post_id)
    end
end
