---
# Feel free to add content and custom Front Matter to this file.

layout: default
---

<div style="padding: 24ch var(--wa-space-4xl); 
  background: radial-gradient(circle at center, var(--wa-color-brand-fill-quiet), var(--wa-color-brand-fill-normal));
  border-radius: 1rem; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);">

  <h2>What's Sato <wa-icon name="uniform-martial-arts"></wa-icon> doing here??</h2>

  <wa-card>
    <div class="wa-stack">
      <div class="wa-flank">
        <wa-avatar image="/images/sato.jpg" label="What's Sato not doing here??" style="--size: 6rem;"></wa-avatar>
        <div class="wa-cluster">
          <strong>Sato (Okinawan karate guy)</strong>
          <span class="wa-caption-s">commented just now...</span>
        </div>
      </div>
      <p>Welcome, Pace family. Check out recent pics...COWARRRRRRDDDD!!!</p>
    </div>
  </wa-card>

  <% collections.family_shares.each do |family_share| %>
    <a href="<%= family_share.relative_url %>"><%= family_share.data.title %></a>
    <h2><%= family_share.data.title %></h2>
    <p><%= markdownify family_share.content %></p>
  <% end %>

  <%# link_to "Singapore and Hyderabad, 2026", "/family/sin_and_hyd_2026" %>
</div>

