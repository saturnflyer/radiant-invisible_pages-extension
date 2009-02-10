class InvisibleYearIndexPage < Page
  
  description %{
    To create a year index for an invisible finder, create a child page for the
    invisible finder and assign the "Invisible Year Index" page type to it.
    
    A year index page makes following tags available to you:
    
    <r:invisibles:children>...</r:invisibles:children>
      Grants access to a subset of the children of the invisible finder page
      that match the specific year which the index page is rendering.
  }
  
  include InvisibleTagsAndMethods
  desc %{
      Grants access to a subset of the children of the invisible finder page
      that match the specific year which the index page is rendering.
      
      *Usage*:
       <pre><code><r:invisibles:children>...</r:invisibles:children></code></pre>
  }
  tag "invisibles:children" do |tag|
    year = $1 if request_uri =~ %r{/(\d{4})/?$}
    tag.locals.children = InvisibleFinder.year_finder(parent.children, year)
    tag.expand
  end
  
end