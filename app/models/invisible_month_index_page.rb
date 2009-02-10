class InvisibleMonthIndexPage < Page
  
  description %{
    To create a month index for invisible pages, create a child page for the
    invisible finder and assign the "Invisible Month Index" page type to it.
    
    A month index page makes following tags available to you:
    
    <r:invisibles:children>...</r:invisibles:children>
      Grants access to a subset of the children of the invisible finder page
      that match the specific year which the index page is rendering.
  }
  
  include InvisibleTagsAndMethods
  desc %{
      Grants access to a subset of the children of the archive page
      that match the specific month which the index page is rendering.
      
      *Usage*:
       <pre><code><r:invisibles:children>...</r:invisibles:children></code></pre>
  }
  tag "invisibles:children" do |tag|
    year, month = $1, $2 if request_uri =~ %r{/(\d{4})/(\d{2})/?$}
    tag.locals.children = InvisibleFinder.month_finder(parent.children, year, month)
    tag.expand
  end
  
end