---
# Feel free to add content and custom Front Matter to this file.

layout: default
---

<h2>Seattle karate's a joke...</h2>

<wa-card>
  <div class="wa-stack">
    <div class="wa-flank">
      <wa-avatar image="/images/sato.jpg" label="What's Sato not doing here??" style="--size: 2rem;"></wa-avatar>
      <div class="wa-cluster">
        <strong>Sato (Okinawan karate tough guy)</strong>
        <span class="wa-caption-s">commented just now...</span>
      </div>
    </div>
    <p>You used password, right? No one can break log...</p>
  </div>
</wa-card>

<ul>
  <li class="wa-stack wa-gap-2xs"><wa-card>
    <div class="wa-stack">
      <div class="wa-flank">
        <wa-avatar image="/images/miyagi.jpg" label="Aftah. Aftah Aftah!" style="--size: 2rem;"></wa-avatar>
        <div class="wa-cluster">
          <strong>Mr. Miyagi (Custodian, hero)</strong>
          <span class="wa-caption-s">commented just now...</span>
        </div>
      </div>
      <p>Hold Miyagi's beer...</p>
    </div>
  </wa-card></li>
</ul>

### Some family updates

<ul>
  <% collections.family_shares.each do |family_share| %>
    <li><span class="wa-body-l"><a href="<%= family_share.relative_url %>">
      <%= family_share.data.title %></a></span></li>
  <% end %>
</ul>


