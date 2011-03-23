function FindProxyForURL(url, host) {
    protocol = url.split(":", 1);
    HTTP_PROXY = "PROXY 127.0.0.1:3128"

    if ( host == "twitpic.com" ||
            //dnsDomainIs(host, "amazon.com") ||
            dnsDomainIs(host, "facebook.com") ||
            dnsDomainIs(host, "wikipedia.org") ||
            dnsDomainIs(host, "wikimedia.org") ||
            dnsDomainIs(host, "twitter.com") ||
            dnsDomainIs(host, "twimg.com") ||
            dnsDomainIs(host, "t.co") ||
            dnsDomainIs(host, "wordpress.com") ||
            dnsDomainIs(host, "feedburder.com") ||
            dnsDomainIs(host, "blog.instapaper.com") ||
            dnsDomainIs(host, "min.us") ||
            dnsDomainIs(host, "docs.google.com") ||
            dnsDomainIs(host, "groups.google.com") ||
            dnsDomainIs(host, "feedproxy.google.com") ||
            dnsDomainIs(host, "chinagfw.org") ||
            dnsDomainIs(host, "yfrom.com") ||
            dnsDomainIs(host, "gstatic.com") ||
            dnsDomainIs(host, "gmodules.com") ||
            dnsDomainIs(host, "youtube.com") ||
            dnsDomainIs(host, "vimeo.com") ||
            dnsDomainIs(host, "ytimg.com") ||
            dnsDomainIs(host, "blogger.com") ||
            dnsDomainIs(host, "android.com") ||
            dnsDomainIs(host, "appspot.com") ||
            dnsDomainIs(host, "theqii.info") ||
            dnsDomainIs(host, "blogspot.com"))
        return HTTP_PROXY;
    else return "DIRECT";
}

