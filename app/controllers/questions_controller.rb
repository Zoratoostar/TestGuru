class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :find_test_questions, only: [:index]
  before_action :dummy_test, only: [:new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show
    @answer_options = @question.answer_options
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
    # render plain: "Question with id: #{params[:id]} was deleted."
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def dummy_test
    @test = Test.new(id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def question_params
    attributes = params.require(:question)
    attributes[:test_id] = params[:test_id] if params[:test_id]
    attributes.permit(:body, :test_id)
  end
end
