module QuestionsHelper

  def question_header(question)
    if question.persisted?
      # title = Test.find(question.test_id).title
      # case I18n.locale
      # when :ru
      #   %(Редактирование вопроса "#{title}")
      # else
      #   %(Edit "#{title}" Question)
      # end
      t('.header', title: Test.find(question.test_id).title)
    else
      # title = Test.find(params[:test_id]).title
      # case I18n.locale
      # when :ru
      #   %(Создание нового вопроса "#{title}")
      # else
      #   %(Create New "#{title}" Question)
      # end
      t('.header', title: Test.find(params[:test_id]).title)
    end
  end

end
