# Gems
require 'kramdown'

# Standard Library
require 'fileutils'

# App Library
require 'serve/build'
require 'serve/read'
require 'serve/parse'

module Serve
  class Init
    # Run Serve
    def self.run(content_dir, template_dir, static_dir)
      Build.process(content_dir, template_dir, static_dir)
      Build.transfer(template_dir, static_dir)
      Build.done(static_dir)
    end
  end
end
