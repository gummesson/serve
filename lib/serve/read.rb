module Serve
  class Read
    # Reads the content
    def self.content(filename)
      File.read(filename)
    end
  end
end
