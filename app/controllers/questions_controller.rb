class QuestionsController < ApplicationController

  def index
    render plain: "#{Question.where(test_id: params[:test_id]).inspect}"
  end

  def show
    # render plain: "#{Question.where(id: params[:id]).inspect}"
  end

  def new
  end

  def create
    # render plain: "#{params[:test_id]}\n #{params[:question]}"

    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.delete(params[:id])

    render plain: "Question with id: #{params[:id]} was deleted."
  end

  private

  def question_params
    attributes = params[:question]
    attributes[:test_id] = params[:test_id]
    attributes.permit(:body, :test_id)
  end

end
