class Admin::AnswerOptionsController < Admin::BaseController

  before_action :find_option, only: [:show, :edit, :update, :destroy]
  before_action :find_question_options, only: [:index]
  before_action :dummy_question, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_option_not_found

  def index; end

  def show; end

  def new
    @question = Question.find(params[:question_id])
    @answer_option = AnswerOption.new
  end

  def edit; end

  def create
    @answer_option = @question.answer_options.new
    if @answer_option.update(answer_option_params)
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer_option.update(answer_option_params)
      redirect_to admin_question_answer_options_path(@answer_option.question_id)
    else
      render :edit
    end
  end

  def destroy
    @answer_option.destroy
    redirect_to admin_question_answer_options_path(@answer_option.question_id)
    flash[:notice] = t('was_deleted', id: params[:id])
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
    render plain: t('admin.answer_options.not_found')
  end

  def answer_option_params
    params.require(:answer_option).permit(:title, :body, :correct)
  end
end
