module SessionsHelper

  def flash_messages(name = nil)
    if name.nil?
      flash.inject(content_tag(:empty).clone_empty) do |buffer, entry|
        buffer.concat content_tag(:p, entry.last, class: "flash #{entry.first}")
      end
    else
      content_tag :p, flash[name], class: "flash #{name}" if flash[name]
    end
  end

end
