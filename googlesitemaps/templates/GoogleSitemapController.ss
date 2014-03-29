<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <% loop $Sitemaps %>
    <url>
        <loc>
            $AbsoluteLink
        </loc>
        <lastmod> $lastmod</lastmod>
        <changefreq>hourly</changefreq>
        <priority>$GooglePriority</priority>
    </url>
<% end_loop %>
</urlset>