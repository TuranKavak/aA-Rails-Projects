class CommentsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create]

  # GET /comments
  # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    @new_comment = @comment.child_comments.new
  end

  # GET /comments/new
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  # GET /comments/1/edit
  # def edit
  
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)

      if @comment.save!
        redirect_to post_url(@comment.post_id)
      else
        flash.now[:errors] = @comment.errors.full_messages
        redirect_to new_post_comment_url(@comment.post_id)
      end
  end

  def downvote
    vote(-1)
  end

  def upvote
    vote(1)
  end

  


  private
  
  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_comment_id)
  end

  def vote(direction)
    @comment = Comment.find(params[:id])
    @user_vote = @comment.user_votes.find_or_initialize_by(user: current_user)

    unless @user_vote.update(value: direction)
      flash[:errors] = @user_vote.errors.full_messages
    end

    redirect_to comment_url(@comment)
  end
end
