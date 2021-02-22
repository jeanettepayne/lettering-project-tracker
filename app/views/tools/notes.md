old tools/new form

<!-- <%= form_for(@tool) do |f| %>
    <label>Brand: </label>
    <%= f.text_field :brand %><br>

    <label>Name: </label>
    <%= f.text_field :name %><br>

    <%= f.fields_for :project_tools do |pt| %>
        <%= pt.hidden_field :project_id, value: params[:project_id] %>
    <% end %> 
    <%= hidden_field_tag @pt.project_id, params[:project_id] %>
    <%= hidden_field_tag @pt.tool_id, "" %>

    <%= f.submit "Add Tool to Project" %>
<% end %> -->


nested pt form 

<h1>Add a New Tool</h1>

<%= form_for :projects_tool, @pt, :url => {:action => "create"} do |f| %>
    <%= f.hidden_field :project_id, value: params[:project_id].to_i %>

    <%= f.fields_for(@tool) do |t| %>
        <label>Brand: </label>
        <%= t.text_field :brand %><br>

        <label>Name: </label>
        <%= t.text_field :name %><br>
    <% end %>

    <label>Favorite Tool</label>
    <%= f.select :favorite, [["Nah, it's just okay", false], ["Duh! It's amazing!", true]] %>


    <%= f.submit "Add Tool" %>

<% end %>