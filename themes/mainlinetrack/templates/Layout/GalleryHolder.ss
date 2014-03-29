<div id="Gallery">
$Content
   <% if GalleryItems %>
      <ul class="galleryList">
      <!-- define limit in brackets -->
      <% control GalleryItems(50) %>
         <li style="float: left; width: 200px; margin: 0 30px 0 0; text-align: center; padding: auto;">
            <a href="$Link"><img src="$GImage.Thumbnail.URL" alt="photo" /></a>
            <div class="details" style="height: 60px;">
            	<% if ImageDescription %>$ImageDescription <% end_if %>
            </div>
         </li>
      <% end_control %>
      </ul>
      <% end_if %>
</div>