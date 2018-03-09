module QuestionsHelper

  def question_header(question)
    header = "#{question.test.title} Question"
    reqfp = request.fullpath
    header = "Create New #{header}" if reqfp.include?('new')
    header = "Edit #{header}" if reqfp.include?('edit')
    header
  end

end
