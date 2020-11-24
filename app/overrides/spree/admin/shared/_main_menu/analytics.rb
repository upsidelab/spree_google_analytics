Deface::Override.new(
    virtual_path:  'spree/admin/shared/_main_menu',
    name:          'main_menu_analytics',
    insert_bottom: "#main-sidebar > nav") do
  <<-HTML
    <% if can? :admin, Spree::Admin::AnalyticsController %>
      <ul class="nav nav-sidebar border-bottom">
         <%= tab *Spree::BackendConfiguration::ANALYTICS_TABS, icon: 'file'  %>
      </ul>
    <% end %>
  HTML
end