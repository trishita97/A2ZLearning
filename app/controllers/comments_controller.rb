class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end
    def show
        @answer = Answer.find(params[:id])
        @comments = @answer.comments
        @comment = Comment.new
        @comment.answer_id=@answer.id
        @tags = Tag.all()
    end
    def create
        @answer = Answer.find(params[:id])
        @comment = @answer.comments.new(comment_params)
        @comment.user_id=current_user.id
        @comment.save!
        u=@answer.user
        score=u.profile.score.to_i+20
        u.profile.update(score: score)

        current_user.profile.update(score: current_user.profile.score.to_i+5)

        redirect_to answer_detail_path(@answer)

    end

    
    private
    def comment_params
      params.require(:comment).permit(:comment)
    end
  
end
