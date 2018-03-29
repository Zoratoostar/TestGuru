module SessionsHelper

  def flash_message(name)
    content_tag :p, flash[name], class: "flash #{name}" if flash[name]
  end

end
