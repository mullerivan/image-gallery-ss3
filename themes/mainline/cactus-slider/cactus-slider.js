var link = new Array(''); //link to display SHOULD BE ARRAY
var alt =  new Array(''); //alt to display SHOULD BE ARRAY

var interval = 3000; //The amount of time to delay between automatically cycling an item. If false, carousel will not automatically cycle.
var show_navigation = true; //show or hidden all navigation
var folder = '../../../assets/Slideshow/'; //where are  all the images
var fade_effect = true ; //fade efect
var css_folder = '/themes/mainline/cactus-slider/'; //where are slider-fade.css
var ajaxphp_folder = "themes/mainline/cactus-slider/"; // slao for json file
var version_of_ie_or_false = isIE();
//Check line 275 where is the ajaxs call
/* ========================================================================
 * Bootstrap: carousel.js v3.1.0
 * http://getbootstrap.com/javascript/#carousel
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */


+function ($) {
    'use strict';

    // CAROUSEL CLASS DEFINITION
    // =========================

    var Carousel = function (element, options) {
        this.$element = $(element)
        this.$indicators = this.$element.find('.carousel-indicators')
        this.options = options
        this.paused =
            this.sliding =
                this.interval =
                    this.$active =
                        this.$items = null

        this.options.pause == 'hover' && this.$element
            .on('mouseenter', $.proxy(this.pause, this))
            .on('mouseleave', $.proxy(this.cycle, this))
    }

    Carousel.DEFAULTS = {
        interval: 5000,
        pause: 'hover',
        wrap: true
    }

    Carousel.prototype.cycle = function (e) {
        e || (this.paused = false)

        this.interval && clearInterval(this.interval)

        this.options.interval
            && !this.paused
        && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))

        return this
    }

    Carousel.prototype.getActiveIndex = function () {
        this.$active = this.$element.find('.item.active')
        this.$items = this.$active.parent().children()

        return this.$items.index(this.$active)
    }

    Carousel.prototype.to = function (pos) {
        var that = this
        var activeIndex = this.getActiveIndex()

        if (pos > (this.$items.length - 1) || pos < 0) return

        if (this.sliding)       return this.$element.one('slid.bs.carousel', function () {
            that.to(pos)
        })
        if (activeIndex == pos) return this.pause().cycle()

        return this.slide(pos > activeIndex ? 'next' : 'prev', $(this.$items[pos]))
    }

    Carousel.prototype.pause = function (e) {
        e || (this.paused = true)

        if (this.$element.find('.next, .prev').length && $.support.transition) {
            this.$element.trigger($.support.transition.end)
            this.cycle(true)
        }

        this.interval = clearInterval(this.interval)

        return this
    }

    Carousel.prototype.next = function () {
        if (this.sliding) return
        return this.slide('next')
    }

    Carousel.prototype.prev = function () {
        if (this.sliding) return
        return this.slide('prev')
    }

    Carousel.prototype.slide = function (type, next) {
        var $active = this.$element.find('.item.active')
        var $next = next || $active[type]()
        var isCycling = this.interval
        var direction = type == 'next' ? 'left' : 'right'
        var fallback = type == 'next' ? 'first' : 'last'
        var that = this

        if (!$next.length) {
            if (!this.options.wrap) return
            $next = this.$element.find('.item')[fallback]()
        }

        if ($next.hasClass('active')) return this.sliding = false

        var e = $.Event('slide.bs.carousel', { relatedTarget: $next[0], direction: direction })
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return

        this.sliding = true

        isCycling && this.pause()

        if (this.$indicators.length) {
            this.$indicators.find('.active').removeClass('active')
            this.$element.one('slid.bs.carousel', function () {
                var $nextIndicator = $(that.$indicators.children()[that.getActiveIndex()])
                $nextIndicator && $nextIndicator.addClass('active')
            })
        }

        if ($.support.transition && this.$element.hasClass('slide')) {
            $next.addClass(type)
            $next[0].offsetWidth // force reflow
            $active.addClass(direction)
            $next.addClass(direction)
            $active
                .one($.support.transition.end, function () {
                    $next.removeClass([type, direction].join(' ')).addClass('active')
                    $active.removeClass(['active', direction].join(' '))
                    that.sliding = false
                    setTimeout(function () {
                        that.$element.trigger('slid.bs.carousel')
                    }, 0)
                })
                .emulateTransitionEnd($active.css('transition-duration').slice(0, -1) * 1000)
        } else {
            $active.removeClass('active')
            $next.addClass('active')
            this.sliding = false
            this.$element.trigger('slid.bs.carousel')
        }

        isCycling && this.cycle()

        return this
    }


    // CAROUSEL PLUGIN DEFINITION
    // ==========================

    var old = $.fn.carousel

    $.fn.carousel = function (option) {
        return this.each(function () {
            var $this = $(this)
            var data = $this.data('bs.carousel')
            var options = $.extend({}, Carousel.DEFAULTS, $this.data(), typeof option == 'object' && option)
            var action = typeof option == 'string' ? option : options.slide

            if (!data) $this.data('bs.carousel', (data = new Carousel(this, options)))
            if (typeof option == 'number') data.to(option)
            else if (action) data[action]()
            else if (options.interval) data.pause().cycle()
        })
    }

    $.fn.carousel.Constructor = Carousel


    // CAROUSEL NO CONFLICT
    // ====================

    $.fn.carousel.noConflict = function () {
        $.fn.carousel = old
        return this
    }


    // CAROUSEL DATA-API
    // =================

    $(document).on('click.bs.carousel.data-api', '[data-slide], [data-slide-to]', function (e) {
        var $this = $(this), href
        var $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
        var options = $.extend({}, $target.data(), $this.data())
        var slideIndex = $this.attr('data-slide-to')
        if (slideIndex) options.interval = false

        $target.carousel(options)

        if (slideIndex = $this.attr('data-slide-to')) {
            $target.data('bs.carousel').to(slideIndex)
        }

        e.preventDefault()
    })

    $(window).on('load', function () {
        $('[data-ride="carousel"]').each(function () {
            var $carousel = $(this)
            $carousel.carousel($carousel.data())
        })
    })

}(jQuery);


/* ========================================================================
 * Bootstrap: transition.js v3.1.0
 * http://getbootstrap.com/javascript/#transitions
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */


+function ($) {
    'use strict';

    // CSS TRANSITION SUPPORT (Shoutout: http://www.modernizr.com/)
    // ============================================================


    function transitionEnd() {
        var el = document.createElement('bootstrap')

        var transEndEventNames = {
            'WebkitTransition': 'webkitTransitionEnd',
            'MozTransition': 'transitionend',
            'OTransition': 'oTransitionEnd otransitionend',
            'transition': 'transitionend'
        }

        for (var name in transEndEventNames) {
            if (el.style[name] !== undefined) {
                return { end: transEndEventNames[name] }
            }
        }

        return false // explicit for ie8 (  ._.)
    }

    // http://blog.alexmaccaw.com/css-transitions
    $.fn.emulateTransitionEnd = function (duration) {
        var called = false, $el = this
        $(this).one($.support.transition.end, function () {
            called = true
        })
        var callback = function () {
            if (!called) $($el).trigger($.support.transition.end)
        }
        setTimeout(callback, duration)
        return this
    }

    $(function () {
        $.support.transition = transitionEnd()
    })

}(jQuery);


// extra variables
//var data = new FormData();
var navigation = '';
//data.append("folder", folder);
////NAVIGATION

jQuery.ajax(
    {
        url: ajaxphp_folder+'cactus-slider.php',
        data: { folder: folder},
        type: 'POST',
        success: function (data) {
            var array_data;
            array_data = data.split(',');
            var first = true;
            //INSERT HTML FOR CARUSEL

            if (document.getElementById("cactus-slider") != null) {
                jQuery('#cactus-slider').html(''); //Clear all first
                // Navigation icons
                if (show_navigation) {
                    navigation = '<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left glyphicon-nonescaped"></span></a>' +
                        '<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right glyphicon-nonescaped"></span></a>'
                }
                //append all the carusel
                jQuery('#cactus-slider').append(
                    '<div id="myCarousel" class="carousel slide carousel-fade col-lg-8 col-offset-2" data-ride="carousel">' +
                        '<ol class="carousel-indicators">' +

                        '</ol>' +
                        '<div class="carousel-inner"></div>' +
                        navigation +
                        '</div>'
                )
                if (show_navigation) {
                    jQuery.each(array_data, function (key, name) {
                        if (first) {
                            jQuery('.carousel-indicators').append(
                                '<li data-target="#myCarousel" data-slide-to="' + key + '" class="active"></li>'
                            )
                        }
                        else {
                            jQuery('.carousel-indicators').append(
                                '<li data-target="#myCarousel" data-slide-to="' + key + '" ></li>'
                            )
                        }
                        first = false

                    })
                }
                first = true;
                //INSERT IMAGES TO CARUSEL
                jQuery.each(array_data, function (key, name) {
                    //replace especial characters
                    name = name.replace('[', '');
                    name = name.replace(']', '');
                    name = name.replace('"', '');
                    name = name.replace('"', '');
                    for (var i = 0; i < 20; i++) {
                        name = name.replace('\\', '');
                    }


                    //Retrieve real name to put on id
                    var id_name = name.split('/');
                    id_name = id_name[id_name.length - 1].split('.')
                    id_name = id_name[0];

                    if (first) {
                        jQuery(".carousel-inner").append('<div class="item active"><a href="' + link[key % link.length] + '"><img title="' + alt[key % alt.length] + '" alt="' + alt[key % alt.length] + '" src=' + name + ' id=' + id_name + ' ></a></div>');
                    }
                    else {
                        jQuery(".carousel-inner").append('<div class="item"><a href="' + link[key % link.length] + '"><img title="' + alt[key % alt.length] + '" alt="' + alt[key % alt.length] + '" src=' + name + ' id=' + id_name + '></a></div>');
                    }
                    first = false
                })
            }

            jQuery('.carousel').carousel({
                interval: interval
            })

            if (fade_effect) {
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet");
                fileref.setAttribute("type", "text/css");
                fileref.setAttribute("href", css_folder + 'cactus-slider-fade.css');
                if (typeof fileref != "undefined")
                    document.getElementsByTagName("head")[0].appendChild(fileref)
            }

            if (version_of_ie_or_false != 7) {
                jQuery.ajax(
                    {
                        url: ajaxphp_folder+'cactus-slider.json',
                        dataType: "text",
                        data: data,
                        cache: false,
                        contentType: false,
                        processData: false,
                        type: 'POST',
                        success: function (json_data) {
                            json_data = JSON.parse(json_data)
                            jQuery.each(json_data, function (key, name) {

                                var img_slider = document.getElementById(key);
                                if (img_slider) {
                                    var anchor_tag = img_slider.parentNode
                                    jQuery.each(name, function (key, value) {
                                        if (value.alt != "") {
                                            img_slider.alt = value.alt
                                        }
                                        if (value.alt != "") {
                                            img_slider.title = value.alt
                                        }
                                        if (value.link != "") {
                                            anchor_tag.href = value.link
                                        }
                                    })
                                }

                            })

                        }
                    })
            }

        }




    })


//Extra funcionaliti for make sure  Internet Explorer work fine
function isIE() {
    var myNav = navigator.userAgent.toLowerCase();
    return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}
