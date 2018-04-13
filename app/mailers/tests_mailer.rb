class TestsMailer < ApplicationMailer

  def completed_test(test_evaluation)
    @user = test_evaluation.user
    @test = test_evaluation.test
    @test_eval = test_evaluation

    mail to: @user.email
  end
end
