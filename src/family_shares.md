---
layout: page
title: Family Shares
---


<% collections.family_shares.each do |family_share| %>
  <div class="row flex-center">
    <div class="card" style="width: 20rem;">
      <div class="card-body">
        <h4 class="card-title"><%= family_share.data.title %></h4>
        <h5 class="card-subtitle"><%= family_share.data.subtitle %></h5>
        <p class="card-text"><%= markdownify family_share.content[0..150].to_s + "..." %></p>
        <a class="card-link" href="<%= family_share.relative_url %>">Read full share</a>
        <!-- <a class="card-link" href="#">Second link</a> -->
      </div>
    </div>
  </div>
<% end %>



