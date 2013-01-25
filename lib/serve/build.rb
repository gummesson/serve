module Serve
  class Build
    # Processes the content
    #
    #  raw_content     = The file's Markdown content.
    #  raw_filename    = The file's filename.
    #  parsed_filename = The filename without the content directory in it's
    #                    name and with the extension changed to .html.
    #
    #  raw_template    = The HTML template file.
    #
    #  parsed_content  = The content parsed to HTML.
    #  static_content  = The parsed content and the HTML template file merged
    #                    together.
    #
    def self.process(content_dir, template_dir, static_dir)
      Dir["#{content_dir}/*"].each do |filename|
        raw_content     = Read.content(filename)
        raw_filename    = File.basename(filename)
        parsed_filename = Parse.filename(raw_filename)

        Dir.mkdir(static_dir) unless File.exists?(static_dir)

        Dir.glob("#{template_dir}/*.html") do |filename|
          raw_template   = Read.content(filename)
          parsed_content = Parse.content(raw_content)
          static_content = Parse.template(raw_template, parsed_content)

          File.write("#{static_dir}/#{parsed_filename}", static_content)
        end
      end
    end

    # Transfers the CSS, JS file and image file(s)
    #
    #  file = All the files in the template directory except the HTML template.
    #
    def self.transfer(template_dir, static_dir)
      Dir["#{template_dir}/*.{css,js,png,jpg,gif,ico}"].each do |file|
        FileUtils.cp(file, static_dir)
      end
    end

    # Displays a "successful build" message
    #
    #  dir = The chosen directory for the static files.
    #
    def self.done(dir)
      puts "Your site was served in #{Dir.pwd}/#{dir}."
    end
  end
end
