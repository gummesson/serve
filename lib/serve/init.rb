module Serve
  class Init
    # Runs Serve
    def self.run(content_dir, template_dir, static_dir)
      Build.process(content_dir, template_dir, static_dir)
      Build.transfer(template_dir, static_dir)
      Build.done(static_dir)
    end
  end
end
