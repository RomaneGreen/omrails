class TweetsController < ApplicationController
  before_action :set_tweet, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  @tweet = Tweet.find(params[:id])

  @comment = @tweet.comments
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.new

  end

  # GET /tweets/1/edit
  def edit

  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.new(tweet_params)
      if @tweet.save
         redirect_to @tweet, notice: 'Tweet was successfully created.'
      else
      render :new
      end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    @tweet = current_user.tweets.find(params[:id])
      if @tweet.update(tweet_params)
       redirect_to @tweet, notice: 'Tweet was successfully updated.'
      else
         render :edit
      end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
   redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:user_id,:content,:image)
    end
end
