# frozen_string_literal: true

module Nazca
  module ViewHelpers
    def tag!(tags = {})
      @_nazca_tags ||= {}
      @_nazca_tags.merge!(tags)
    end

    def title(text)
      tag!(title: normalize(text))
      text
    end

    def keywords(words)
      tag!(keywords: normalize(words))
      words
    end

    def description(text)
      tag!(description: normalize(text))
      text
    end

    def noindex
      tag!(noindex: true)
    end

    def nofollow
      tag!(nofollow: true)
    end

    def canonical(href)
      tag!(canonical: href)
      href
    end

    def meta_tags(site_name, separator: "|", reverse: false, **options)
      tags = options.merge(@_nazca_tags || {})

      title_parts = tags[:title].to_s.empty? ? [site_name] : [site_name, separator, tags[:title]]
      title_parts.reverse! if reverse

      result = +""
      result << content_tag(:title, title_parts.join(" ").html_safe)
      result << tag(:meta, name: :description, content: tags[:description]) if tags[:description]
      result << tag(:meta, name: :keywords, content: tags[:keywords]) if tags[:keywords]

      robots = []
      robots << "noindex" if tags[:noindex]
      robots << "nofollow" if tags[:nofollow]
      result << tag(:meta, name: :robots, content: robots.join(", ")) if robots.any?
      result << tag(:link, rel: :canonical, href: tags[:canonical]) if tags[:canonical]

      result.html_safe
    end

    private

    # Strips any HTML tags from the value so meta content stays plain text.
    def normalize(string)
      string.gsub(/<\/?[^>]*>/, "")
    end
  end
end
