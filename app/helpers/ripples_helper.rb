module RipplesHelper
  def websitelink(ripple)
    author = ripple.author
    if ripple.website != ''
      author = link_to(ripple.author, "http://#{ripple.website}", target: :_blank)
    end
    author
  end
end
