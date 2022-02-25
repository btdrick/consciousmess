module RipplesHelper

  def newest_ripples_link
    newest_link = ''
    if session[:page] > 0
      newest_link = link_to 'Newest', ripples_path, class:"nav-link"
    end
    newest_link
  end

  def previous_ripples_link
    previous_10_link = ''
    if session[:page] > 1
      previous_10_link = link_to 'Previous 10 Ripples',
        ripples_path(page: session[:page] - 1), class:"nav-link"
    elsif session[:page] == 1
      previous_10_link = link_to 'Previous 10 Ripples',
        ripples_path, class:"nav-link"
    end
    previous_10_link
  end

  def next_ripples_link
    next_10_link = ''
    if session[:page] >= 0 && !more_ripples?
      next_10_link = link_to 'Next 10 Ripples',
        ripples_path(page: session[:page] + 1), class:"nav-link"
    end
    next_10_link
  end

  def oldest_ripples_link
    oldest_link = ''
    if !more_ripples?
      oldest_link = link_to 'Oldest', ripples_path(page: get_last_page),
        class:"nav-link"
    end
    oldest_link
  end

  def website_link(ripple)
    author = ripple.author
    if ripple.website != ''
      author = link_to(ripple.author, "#{ripple.website}", target: :_blank)
    end
    author
  end

  private
    def more_ripples?
      (session[:page] + 1) * 10 >= Ripple.count
    end

    def get_last_page
      page_number = Ripple.count / 10
      if Ripple.count % 10 == 0
        page_number -= 1
      end
      page_number
    end

end
