module Serve
  class Parse
    # Parses the filename
    #
    #  filename = The given filename. Returns a parsed filename without the
    #             content directory in it's name and changes the extension to
    #             .html.
    #
    def self.filename(filename)
      filename = File.basename(filename)
      filename.sub(/\..*$/, ".html")
    end

    # Parses the Markdown content
    #
    #  content = The given content. Returns the the Markdown content parsed to
    #            HTML via the kramdown gem.
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
