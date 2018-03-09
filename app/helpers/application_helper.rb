module ApplicationHelper

  def current_year
    Time.now.to_formatted_s(:year)
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}"
  end

end
