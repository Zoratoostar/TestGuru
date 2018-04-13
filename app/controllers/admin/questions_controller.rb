class Admin::QuestionsController < Admin::BaseController

  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :dummy_test, only: [:new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @answer_options = @question.answer_options
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = @test.questions.new
    if @question.update(question_params)
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id)
    flash[:notice] = t('was_deleted', id: params[:id])
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def dummy_test
    @test = Test.new(id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: t('admin.questions.not_found')
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
