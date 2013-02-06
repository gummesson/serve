# Standard Library
require 'fileutils'

# App Library
require 'serve/build'
require 'serve/parse'

module Serve
  class Init
    # Builds the whole site by running it through the build process.
    #
    #  content_dir  = The given content directory.
    #                 Default: "content".
    #
    #  template_dir = The given template directory.
    #                 Default: "template".
    #
    #  static_dir   = The given static directory.
    #                 Default: "static".
    #
    #  parser       = The given Markdown parser.
    #                 Default: kramdown.
    #
    def self.start(content_dir, template_dir, static_dir, parser)
      Build.process(content_dir, template_dir, static_dir, parser)
      Build.transfer(template_dir, static_dir)
      Build.done(static_dir)
    end
  end
end
