<div id="GalleryItem">
	<div style="width: 150px; float: right; padding-right: 30px;"><a href="$Parent.Link">back to Gallery</a></div>
	<h2>$Title</h2>
	<img src="$GImage.Normal.URL" alt="photo" />
	<div class="content typography">$Content</div>
	<p class="details"><% if ImageDescription %>$ImageDescription <% end_if %></p>
</div>