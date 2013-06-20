table_checksum
==============

Gem adds methods to the ActiveRecord::Base classes to easily generate checksum of some table using CREATE CHECKSUM \`table_name\`; syntax

    User.checksum # => ["database.users", 2513815180]

This is useful for fragment caching when you list all records from table in cached partial

    <%= cache [@event, User.checksum] do %>
      ...
        <%= f.collection_select :user_id, @users || User.all, :id, :name %>
      ...
    <% end %>
    
It also uses PerRequestCache for performance.

I tried to write the PerRequestCache as much threadsafe as i could