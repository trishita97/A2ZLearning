class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
      user = current_user.id
      answer = params[:id]
      @like=Like.find_or_create_by(user_id: user, answer_id: answer)
      
      # binding.pry
      
      u=Answer.find_by_id(answer).user
      score=u.profile.score.to_i+5
      u.profile.update(score: score)
      render json: {count: Answer.find(answer).likes.count, isLiked: true}
  end

  def destroy
    user = current_user.id
    answer = params[:id]
    @like=Like.find_by(user_id: user, answer_id: answer)
    @like.delete
    u=Answer.find_by_id(answer).user
    score=u.profile.score.to_i-5
    u.profile.update(score: score)
    render json: {count: Answer.find(answer).likes.count, isLiked: false}
  end
  
end