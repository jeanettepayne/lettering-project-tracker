<%= f.fields_for(:tool) do |ft| %>
        <label>Select Existing Brand or Enter a New One</label>
        <%= ft.text_field :brand, list: "brands_autocomplete" %>
            <datalist id="brands_autocomplete">
                <% Tool.select(:brand).each do |tool| %>
                    <option value="<%= tool.brand %>">
                <% end %>
            </datalist><br>

        <label>Select Existing Tool Name or Enter a New One</label>
        <%= ft.text_field :name, list: "names_autocomplete" %>
            <datalist id="names_autocomplete">
                <% Tool.select(:name).each do |tool| %>
                    <option value="<%= tool.name %>">
                <% end %>
            </datalist><br>
    <% end %>