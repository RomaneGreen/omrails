class CommentsController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
    redirect_to @tweet
  end

  private

  def comment_params
      params.require(:comment).permit(:content)
  end
end
