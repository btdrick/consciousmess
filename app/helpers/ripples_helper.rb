module RipplesHelper
  def websitelink(ripple)
    if ripple.website == ''
      ripple.author
    else
      link_to(ripple.author, "http://#{ripple.website}", target: :_blank)
    end
  end
end
