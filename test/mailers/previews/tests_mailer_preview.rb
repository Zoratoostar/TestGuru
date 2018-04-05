# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tests_mailer/completed_test
  def completed_test
    test_evaluation = TestEvaluation.new(user: User.last, test: Test.last)

    TestsMailer.completed_test(test_evaluation)
  end

end
