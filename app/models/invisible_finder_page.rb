class InvisibleFinderPage < Page
  
  description %{
    An invisible finder page provides behavior similar a archive page.
    Child page URLs are altered to be in %Y/%m/%d format (2004/05/06).
    
    An invisible finder page can be used in conjunction with the "Invisible
    Year Index", "Invisible Month Index", and "Invisible Day Index" page 
    types to create year, month, and day indexes.
  }
  
  # def child_url(child)
  #   date = child.published_at || Time.now
  #   clean_url "#{ url }/#{ date.strftime '%Y/%m/%d' }/#{ child.slug }"
  # end
  
  def find_by_url(url, live = true, clean = true)
    url = clean_url(url) if clean
    if url =~ %r{^#{ self.url }(\d{4})(?:/(\d{2})(?:/(\d{2}))?)?/?$}
      year, month, day = $1, $2, $3
      children.find_by_class_name(
        case
        when day
          'InvisibleDayIndexPage'
        when month
          'InvisibleMonthIndexPage'
        else
          'InvisibleYearIndexPage'
        end
      )
    else
      super
    end
  end
end