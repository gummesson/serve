module Serve
  class Parse
    # Parses the filename
    #
    #  special_chars = ', !, ?, : and trailing whitespace.
    #
    #  filename      = The given filename. Returns a parsed filename with all
    #                  the letters transformed to downcase, stripped from all
    #                  the special characters, no whitespace and a changed
    #                  extension to .html.
    #
    def self.filename(filename)
      special_chars = /(\'|\!|\?|\:|\s\z)/

      filename.downcase
      filename.gsub(special_chars, "").gsub(/\s/, "-").sub(/\..*$/, ".html")
    end

    # Parses the Markdown content
    #
    #  content = The given content. Returns the the Markdown content parsed to
    #            HTML via the kramdown gem without auto ID's.
    #
    def self.content(content)
      Kramdown::Document.new(content, :auto_ids => false).to_html
    end

    # Parses the HTML template
    #
    #  raw template   = The HTML template file.
    #  parsed_content = The parsed content.
    #
    #  Puts the parsed content in the HTML template file by replacing
    #  the content delimiter, [CONTENT], with the parsed content.
    #
    def self.template(raw_template, parsed_content)
      raw_template.sub("[CONTENT]", parsed_content)
    end
  end
end
