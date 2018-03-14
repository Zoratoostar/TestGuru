module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edit #{Test.find(question.test_id).title} Question"
    else
      "Create New #{Test.find(params[:test_id]).title} Question"
    end
  end

end
