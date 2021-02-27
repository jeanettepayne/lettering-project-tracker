MAYBE TAKE THIS OUT COME BACK LATER - try to make uniq after switching add tool to select or enter
<h4>My Toolbox: </h4>
<% @user.projects.each do |proj| %>
    <% proj.projects_tools.each do |pt| %>
        <%= pt.tool.brand %> <%= pt.tool.name %><br>
    <% end %>
<% end %>