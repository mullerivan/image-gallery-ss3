<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner">
        <% loop $Picture %>
            <% if $First %>
            <div class="item active" id="$Name">
            <% else %>
            <div class="item" id="$Name">
            <% end_if %>
            <div class="view-full-image">
                <a href="$Filename" data-lightbox="carousel2"><img title="view full size image"
                                                                   alt="view full size image"
                                                                   src="$BaseHref/themes/mainlinetrack/images/zoomin.png"/></a>
            </div>
            <a href="$Filename" data-lightbox="carousel"><img title="$Title" alt="$Title"
                                                              src="$PaddedImage(368,206).URL"/></a>
        </div>
        <% end_loop %>
    </div>
    </div>
    <br>

    <div id="gallery-thumbnails">
        <% if $Picture.count > 3%>
            <img alt="Previous image" class="scroll-arrow" id="rew-link"
                 src="$BaseHref/themes/mainlinetrack/images/arrow-scroll-left.png">

        <% end_if%>
        <div id="thumbnail-slider" class="gallery-thumbs">
            <% loop $Picture %>
                <a id="$Name" href="#" onclick="changeActiveItem($pos);"><img id="$Name" title="$Title" alt="$Title" src="$PaddedImage(90,51).URL"></a>
            <% end_loop %>
        </div>
        <% if $Picture.count > 3%>
            <img alt="Next image" class="scroll-arrow" id="ffw-link"
                 src="$BaseHref/themes/mainlinetrack/images/arrow-scroll-right.png">
        <% end_if%>

    </div>

    <div id="scroll-worded">
        <div id="scroll-text-info">Photo <span id="scroll-info-current">1</span> of <span
                id="scroll-info-total">$Picture.count</span></div>
    </div>


</div>


<script>
    /* --------------------------------------
-- Settings and init
-------------------------------------- */
    var giImgTotal = $Picture.count +1;
    /* Number of images in gallery */
    var giCurrentImage = 1;
    /* Image displayed on init */

    var giSliderPosition = 1;
    /* Initial position for scroller */
    var giThumbsShown = 3;
    /* Thumbnails shown on scroller */
    var giTotalPositions = giImgTotal - giThumbsShown;
    /* Number of possible positions for scroller */

    /* --------------------------------------
    -- Hide and/or show slider arrow buttons
    -------------------------------------- */
    function showHideSliderButtons() {
        /* Right side*/
        if (giSliderPosition == giTotalPositions) toggleSliderArrows(1, 0);
        /* left side*/
        else if (giSliderPosition == 0) toggleSliderArrows(0, 1);
        /* middle */
        else toggleSliderArrows(1, 1);
    }

    function toggleSliderArrows(bLeftOn, bRightOn) {
        if (bLeftOn == 1) jQuery("#rew-link").removeClass("arrow-inactive");
        else jQuery("#rew-link").addClass("arrow-inactive");

        if (bRightOn == 1) jQuery("#ffw-link").removeClass("arrow-inactive");
        else jQuery("#ffw-link").addClass("arrow-inactive");
    }

    function scrolltoGroup(obj) {
        sButtonId = jQuery(obj).attr("id");

        if (sButtonId == "rew-link") {
            /* Rewind (scroll to left) */
            giSliderPosition -= giThumbsShown;
            if (giSliderPosition < 0) giSliderPosition = 0;
        } else {
            /* Forewind (scroll to right) */
            giSliderPosition += giThumbsShown;
            if (giSliderPosition > giTotalPositions) giSliderPosition = giTotalPositions;
        }
        jQuery("#thumbnail-slider").animate({
            left: "-" + 72 * giSliderPosition + "px"
        });

        showHideSliderButtons();
    }

    function centerSlider(imageId) {
        /* Assumes odd number of thumbs shown so that selected thumb can be 'centred' */
        if (imageId <= (giThumbsShown + 1) / 2) {
            giSliderPosition = 0;
        } else if (imageId > giImgTotal - ((giThumbsShown + 1) / 2)) {
            giSliderPosition = giTotalPositions;
        } else {
            giSliderPosition = imageId - ((giThumbsShown + 1) / 2);
        }

        jQuery("#thumbnail-slider").animate({
            left: "-" + 72 * giSliderPosition + "px"
        });
    }

    function swapGalleryImage(ancThumbnail) {
        var newImgSrc = jQuery(ancThumbnail).children("img").attr("src");
        var newImgId = parseInt(jQuery(ancThumbnail).attr("imgid"));
        var currentImg = jQuery("#gallery-large-image table img");
        if (newImgSrc != currentImg.attr("src")) {
            /* Swap large image */
            currentImg.attr("src", newImgSrc);

            /* Swap description and date */
            jQuery("#gallery-image-title").html(jQuery("#thumbnail-descriptions").children().eq(newImgId - 1).html());
            jQuery("#gallery-image-mod-date span").html(jQuery("#thumbnail-dates").children().eq(newImgId - 1).html());

            /* Update thumbnail semi-transparent overlay */
            jQuery(".zoom-icon").css("display", "none");
            jQuery(".selected-image").removeClass("selected-image");
            jQuery(ancThumbnail).children(".zoom-icon").css("display", "block");
            jQuery(ancThumbnail).addClass("selected-image");
        }
    }

    jQuery(document).ready(function () {
        thumbnailCount = 0;
        jQuery("#thumbnail-slider a").each(function () {
            thumbnailCount++;
            jQuery(this).attr("imgId", thumbnailCount);
        });

        jQuery("#thumbnail-slider a").click(function () {
            swapGalleryImage(jQuery(this));
            centerSlider(jQuery(this).attr("imgid"));
            showHideSliderButtons();
            jQuery("#scroll-info-current").html(jQuery(this).attr("imgid"));
            return false;
        });

        jQuery(".scroll-arrow").click(function () {
            if (jQuery(this).hasClass("arrow-inactive") === false) scrolltoGroup(this);
        });

        /* Previous / next button, large image left/right overlay click handler */
        jQuery(".scroll-text, .gallery_hover").click(function () {
            var currentImage = parseInt(jQuery(".selected-image").attr("imgid"));
            var newImageId = 0;
            if (jQuery(this).attr("id") === "rew-link-2" || jQuery(this).attr("id") === "rew-link-1") {
                /* Show previous image */
                if (currentImage > 1) {
                    newImageId = currentImage - 1;
                }
            } else {
                /* Show next image */
                if (currentImage < giImgTotal) {
                    newImageId = currentImage + 1;
                }
            }
            if (newImageId != 0) {
                objButton = jQuery("#thumbnail-slider a[imgid='" + newImageId + "']");
                swapGalleryImage(objButton);
                centerSlider(newImageId);
                showHideSliderButtons();
                jQuery("#scroll-info-current").html("" + newImageId);
            }
            return false;
        });
    });


    jQuery("#thumbnail-slider").animate({
        left: "-" + 72 * 0 + "px"
    });
    toggleSliderArrows(0, 1)
    //
    jQuery('.carousel').carousel({interval: 0 });
    function changeActiveItem(pos) {
        jQuery('.carousel').carousel(pos - 1)
    }


</script>


<style type="text/css">
    /* ------------------------------------------------------ */
    /* - Gallery carousel - large image --------------------- */
    /* ------------------------------------------------------ */

    #gallery-large-image table {
        height: 100%;
        margin: 0;
        width: 100%;
    }

    #gallery-large-image table td {
        font-size: 0;
        padding: 0;
        text-align: center;
    }

    #gallery-large-image img {
        max-height: 350px;
        max-width: 600px;
        padding: 1px;
    }

    #gallery-large-image a.arrow-inactive {
        height: 0;
        overflow: hidden;
        z-index: -1;
        width: 0;
    }

    /* ------------------------------------------------------ */
    /* - Gallery carousel - thumbnails ---------------------- */
    /* ------------------------------------------------------ */

    #gallery-thumbnails {
        position: relative;
    }

    #thumbnail-slider {
        margin: 0 10px 0 10px;

    }

    .gallery-thumbs {
        white-space: nowrap;
        position: relative;
    }

    .gallery-thumbs a img {
        border: 2px solid #5A5A5A;
        height: 45px;
        margin: 0 1px;
        width: 66px;
    }

    .gallery-thumbs a img:hover {
        border: 2px solid #AAAAAA;
    }

    .gallery-thumbs a.selected-image img {
        border: 2px solid #DDDDDD;
    }

    .zoom-icon img {
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    img.scroll-arrow {
        /*cursor: pointer;*/
        position: absolute;
        z-index: 99;
        top: 0px;
    }

    #ffw-link {
        left: 304px;
    }

    #rew-link {
        left: -10px;
    }

    #gallery-thumbnails img.scroll-arrow:hover {
        filter: alpha(opacity=80);
        opacity: 0.7;
    }

    #gallery-thumbnails img.arrow-inactive,
    #gallery-thumbnails img.arrow-inactive:hover {
        cursor: auto;
        filter: alpha(opacity=20);
        opacity: 0.2;
        visibility: hidden;
    }

    .scroll-arrow {
        height: 50px;;
    }
</style>