class InvisibleDayIndexPage < Page
  
  description %{
    To create a day index for an archive, create a child page for the
    invisible finder and assign the "Invisible Day Index" page type to it.
    
    A day index page makes following tags available to you:
    
    <r:invisibles:children>...</r:invisibles:children>
      Grants access to a subset of the children of the invisible finder page
      that match the specific year which the index page is rendering.
  }
  
  include InvisibleTagsAndMethods
  desc %{
      Grants access to a subset of the children of the invisible finder page
      that match the specific day which the index page is rendering.
      
      *Usage*:
       <pre><code><r:invisibles:children>...</r:invisibles:children></code></pre>
  }
  tag "invisibles:children" do |tag|
    year, month, day = $1, $2, $3 if request_uri =~ %r{/(\d{4})/(\d{2})/(\d{2})/?$}
    tag.locals.children = InvisibleFinder.day_finder(parent.children, year, month, day)
    tag.expand
  end
  
end