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
old tools/new form