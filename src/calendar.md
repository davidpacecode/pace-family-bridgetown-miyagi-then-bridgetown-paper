---
layout: page
title: Calendar
---

<div class="wa-stack wa-gap-0">
  <div class="wa-justify-content-center wa-font-weight-bold" style="border: solid 1px;">
      March 2026
  </div>
  <div class="wa-grid wa-flex-nowrap wa-gap-0 wa-justify-content-center wa-font-weight-bold"
    style="grid-template-columns: repeat(7, 1fr); border: solid 1px;">
    <div style="border: solid 1px;">Sunday</div>
    <div style="border: solid 1px;">Monday</div>
    <div style="border: solid 1px;">Tuesday</div>
    <div style="border: solid 1px;">Wednesday</div>
    <div style="border: solid 1px;">Thursday</div>
    <div style="border: solid 1px;">Friday</div>
    <div style="border: solid 1px;">Saturday</div>
  </div>
  <div class="wa-grid wa-flex-nowrap wa-gap-0 wa-justify-content-center"
    style="grid-template-columns: repeat(7, 1fr); grid-template-rows: repeat(5, 100px); border: solid 1px;">
    <% (1..35).each do |day| %>
      <div style="border: solid 1px;"><%= day.to_s unless day > 31 %></div>
    <% end %>
  </div>
</div>


