module Serve
  class Parse
    # Parses the filename
    def self.filename(filename)
      filename = File.basename(filename)
      filename.sub(/\..*$/, ".html")
    end

    # Parses the Markdown content
    def self.content(content)
      Kramdown::Document.new(content, :auto_ids => false).to_html
    end

    # Parses the HTML template
    def self.template(raw_template, parsed_content)
      raw_template.sub("[CONTENT]", parsed_content)
    end
  end
end
