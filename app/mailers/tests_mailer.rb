class TestsMailer < ApplicationMailer

  def completed_test(test_evaluation)
    @user = test_evaluation.user
    @test = test_evaluation.test

    mail to: @user.email, subject: %(You just completed the "#{@test.title}" test!)
  end
end
