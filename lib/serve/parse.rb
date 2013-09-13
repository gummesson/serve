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
      filename.downcase.gsub(special_chars, "").gsub(/\s/, "-").sub(/\..*$/, ".html")
    end

    # Parses the Markdown content
    #
    #  content = The given content. Returns the the Markdown content parsed to
    #            HTML via the chosen gem.
    #
    #  parser  = The given Markdown parser gem.
    #
    def self.content(content, parser)
    case parser
      when "kramdown"
        require 'kramdown'
        Kramdown::Document.new(content, :auto_ids => false).to_html

      when "redcarpet"
        require 'redcarpet'
        render_html    = Redcarpet::Render::HTML
        render_options = { :no_intra_emphasis  => true,
                           :fenced_code_blocks => true }
        redcarpet = Redcarpet::Markdown.new(render_html, render_options)
        redcarpet.render(content)

      when "rdiscount"
        require 'rdiscount'
        RDiscount.new(content).to_html

      when "maruku"
        require 'maruku'
        Maruku.new(content).to_html_document

      else
        raise "Please choose a valid Markdown parser. For more information, see 'serve --help'."
      end
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
