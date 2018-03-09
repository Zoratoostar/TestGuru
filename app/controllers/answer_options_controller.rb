class AnswerOptionsController < ApplicationController

  before_action :find_option, only: [:show, :edit, :update, :destroy]
  before_action :find_question_options, only: [:index]
  before_action :dummy_question, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_option_not_found

  def index; end

  def show; end

  def new
    @answer_option = AnswerOption.new
    # @question = Question.find(params[:question_id])
  end

  def edit; end

  def create
    @answer_option = AnswerOption.new(answer_option_params)
    if @answer_option.save
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
    attributes = params.require(:answer_option)
    attributes[:question_id] = params[:question_id] if params[:question_id]
    attributes.permit(:title, :body, :correct, :question_id)
  end
end
