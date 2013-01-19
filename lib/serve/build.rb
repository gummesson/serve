module Serve
  class Build
    #
    # Processes the content
    #
    #  raw_content     = The file's Markdown content.
    #  parsed_filename = Removes the content folder from the filename
    #                    and changes the extension to .html.
    #
    #  raw_template    = The HTML template file.
    #  parsed_content  = Parses the file's content to HTML.
    #  static_content  = Puts the parsed_content in the raw_template
    #                    by replacing the content delimiter.
    #
    def self.process(content_dir, template_dir, static_dir)
      Dir["#{content_dir}/*"].each do |filename|
        raw_content     = Read.content(filename)
        parsed_filename = Parse.filename(filename)

        unless File.exists?(static_dir)
          Dir.mkdir(static_dir)
        end

        File.open("#{static_dir}/#{parsed_filename}", "w") do |file|
          Dir.glob("#{template_dir}/*.html") do |filename|
            raw_template = Read.content(filename)

            parsed_content = Parse.content(raw_content)
            static_content = Parse.template(raw_template, parsed_content)

            file.puts(static_content)
          end
        end
      end
    end

    # Transfers the CSS file(s)
    def self.transfer(template_dir, static_dir)
      Dir.glob("#{template_dir}/*.css") do |filename|
        FileUtils.cp(filename, static_dir)
      end
    end

    # Displays a message
    def self.done(dir)
      puts "Your site was served in #{Dir.pwd}/#{dir}."
    end
  end
end
