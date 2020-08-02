require 'uri'

module Jekyll
  module UriFilter
    def url_hostname(input)
      uri = URI::parse(input)
      hostname = uri.hostname
      if hostname
        if hostname.start_with?("www.")
          hostname.delete_prefix!("www.")
        end

        hostname
      else
        input
      end
    rescue URI::InvalidURIError
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::UriFilter)
