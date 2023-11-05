class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    begin
      @tweet = Tweet.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :json => "404"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.create(tweet_params)
    redirect_to user_path(@user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @user = User.find(@tweet.user_id)
    @tweet.destroy
    redirect_to user_path(@user), status: :see_other
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end

end