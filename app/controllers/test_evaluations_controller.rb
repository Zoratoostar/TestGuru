class TestEvaluationsController < ApplicationController

  before_action :find_test_evaluation, only: [:show, :update, :result]

  def show; end

  def result; end

  def update
    @test_eval.accept!(params[:option_ids])

    if @test_eval.completed?
      TestsMailer.completed_test(@test_eval).deliver_now
      redirect_to result_test_evaluation_path(@test_eval)
    else
      render :show
    end
  end

  private

  def find_test_evaluation
    @test_eval = TestEvaluation.find(params[:id])
  end
end
