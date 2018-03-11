class AnswerOptionsController < ApplicationController

  before_action :find_option, only: [:show, :edit, :update, :destroy]
  before_action :find_question_options, only: [:index]
  before_action :dummy_question, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_option_not_found

  def index; end

  def show; end

  def new
    @answer_option = @question.answer_options.new
  end

  def edit; end

  def create
    @answer_option = @question.answer_options.new
    if @answer_option.update(answer_option_params)
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer_option.update(answer_option_params)
      redirect_to @answer_option
    else
      render :edit
    end
  end

  def destroy
    @answer_option.destroy
    redirect_to question_answer_options_path(@answer_option.question_id)
    # render plain: "Answer option with id: #{params[:id]} was deleted."
  end

  private

  def find_option
    @answer_option = AnswerOption.find(params[:id])
  end

  def find_question_options
    @answer_options = Question.find(params[:question_id]).answer_options
  end

  def dummy_question
    @question = Question.new(id: params[:question_id])
  end

  def rescue_with_option_not_found
    render plain: 'Answer option was not found'
  end

  def answer_option_params
    params.require(:answer_option).permit(:title, :body, :correct)
  end
end
