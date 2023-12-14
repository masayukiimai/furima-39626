<%= form_with model: @purchase_form, url: purchases_path, method: :post, local: true do |f| %>
  <%= render 'shared/error_messages', model: @purchase_form %>

  <div class="field">
    <%= f.label :postal_code, "郵便番号（例：123-4567）" %>
    <%= f.text_field :postal_code, placeholder: "123-4567" %>
  </div>

  <div class="field">
    <%= f.label :region_id, "都道府県" %>
    <%= f.collection_select :prefecture_id, Prefecture.all, :id, :name, {prompt: "選択してください"} %>
  </div>

  <div class="field">
    <%= f.label :city, "市区町村" %>
    <%= f.text_field :city %>
  </div>

  <div class="field">
    <%= f.label :address, "番地" %>
    <%= f.text_field :address %>
  </div>

  <div class="field">
    <%= f.label :building, "建物名（任意）" %>
    <%= f.text_field :building %>
  </div>

  <div class="field">
    <%= f.label :phone_number, "電話番号" %>
    <%= f.telephone_field :phone_number, placeholder: "例）09012345678" %>
  </div>

  <%= f.submit "購入する", class: "btn" %>
<% end %>
