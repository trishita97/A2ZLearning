class AnswersController < ApplicationController
    def create
        @question = Question.find(params[:id])
        @answer = @question.answers.new(answer_params)
        @answer.user_id=current_user.id
        @answer.save!
        @question.user.profile.update(score: @question.user.profile.score.to_i+5)
        current_user.profile.update(score: current_user.profile.score.to_i+30)
        redirect_to question_detail_path(@question)
    end
    def show
        @answer.like
    end

    private
    def answer_params
        params.require(:answer).permit(:answer)
    end
end
