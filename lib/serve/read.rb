module Serve
  class Read
    # Reads the content
    #
    #  filename = The given filename. Returns the file's Markdown content.
    #
    def self.content(filename)
      File.read(filename)
    end
  end
end
