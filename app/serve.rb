# Add lib to path
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

# Standard Library
require 'optparse'

# Load Serve
require 'serve'

# Directories
dir = {
  :content  => "content",
  :template => "template",
  :static   => "static"
}

# Options
OptionParser.new do |opt|
  opt.banner = "Usage: serve [options]"

  opt.on("-c", "--content CONTENT", "Content directory") do |c|
    dir[:content] = c
  end

  opt.on("-t", "--template TEMPLATE", "Template directory") do |t|
    dir[:template] = t
  end

  opt.on("-s", "--static STATIC", "Static directory") do |s|
    dir[:static] = s
  end
end.parse!

# Run Serve with the given arguments
Serve::Init.run(dir[:content], dir[:template], dir[:static])
