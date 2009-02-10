# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class InvisiblePagesExtension < Radiant::Extension
  version "1.0"
  description "Invisible Pages allows you to hide pages from the main page index."
  url "http://saturnflyer.com"
  
  define_routes do |map|
    map.connect 'admin/invisible_pages/:action', :controller => 'admin/invisible_pages'
  end
  
  def activate
    InvisibleFinderPage
    InvisibleYearIndexPage
    InvisibleMonthIndexPage
    InvisibleDayIndexPage
    use_dashboard = 'false'
    if Radiant::Config.table_exists?
      Radiant::Config['page.invisibles.use_dashboard'] = 'true' unless Radiant::Config['page.invisibles.use_dashboard']
      use_dashboard = Radiant::Config['page.invisibles.use_dashboard']
    end
    if admin.respond_to?(:dashboard) && use_dashboard == 'true'
      admin.dashboard.index.add :extensions, 'invisible_pages'
    else
      admin.tabs.add "Invisible Pages", "/admin/invisible_pages", :visibility => [:developer, :admin]
    end
  end
  
  def deactivate
  end
  
end