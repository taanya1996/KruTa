class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
    if @comment.attributes["id"].nil?
      # puts @comment.attributes
      # render 'tweets_controller/show', status: :unprocessable_entity
      redirect_to tweet_path(@tweet)
    else
      redirect_to tweet_path(@tweet)
    end
  end

  def index
    @comments = Comment.all
  end
  def show
    begin
      @comment = Comment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :json => "404"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = Tweet.find(@comment.tweet_id)
    @comment.destroy
    redirect_to tweet_path(@tweet), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end