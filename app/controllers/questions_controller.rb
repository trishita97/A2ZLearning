class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def show
      @question = Question.find(params[:id])
      @answers = @question.answers
      @answer = Answer.new
      @answer.question_id=@question.id
      @tags = Tag.all()
  end
    
  def index
        @questions = Question.all 
        
        @tags = Tag.all()
  end

  def search
    # binding.pry
    q=params[:q]
    @questions = Question.where('title like ?',"%"+q+"%")
    
    @tags = Tag.all()
  end
  def myquestions
    @questions = current_user.questions
    @tags = Tag.all()
  end

  def answered
    question_ids=current_user.answers.map{|ans|ans.question_id}
    @questions = Question.where('id in (?)',question_ids)
    @tags = Tag.all()
  end

  def commented
    answer_ids=current_user.comments.map{|comment|comment.answer_id}
    question_ids = Answer.where('id in (?)', answer_ids).map{|ans|ans.question_id}
    @questions = Question.where('id in (?)',question_ids)
    @tags = Tag.all()
  end

  def liked
    answer_ids=current_user.likes.map{|like|like.answer_id}
    question_ids = Answer.where('id in (?)', answer_ids).map{|ans|ans.question_id}
    @questions = Question.where('id in (?)',question_ids)
    
    @tags = Tag.all()
  end

  def search_by_tag
    tag=params[:tag]
    tag=Tag.find_by_name(tag)
    tags = QuestionTag.where(tag_id: tag.id)
    @questions = Question.where('id in (?)',tags.map{|t|t.question_id})
    
    @tags = Tag.all()
  end
  def ask
    @question = current_user.questions.new
    @tags = Tag.all()
  end

  def create
      @question = current_user.questions.new(question_params)
      @question.save!

      # binding.pry

      tags=params[:tags].split(',').map{|t| t.strip}
      tags.each do |tag|
        te=Tag.find_by_name(tag)
        if te.present?
          QuestionTag.create(question_id: @question.id, tag_id: te.id)
        else
          tn=Tag.create(name: tag)
          QuestionTag.create(question_id: @question.id, tag_id: tn.id)
        end
      end
      current_user.profile.update(score: current_user.profile.score.to_i+50)
      redirect_to root_path(@question)
      
  end
   
  private
    def question_params
      params.require(:question).permit(:title, :description, :tag)
    end
end
