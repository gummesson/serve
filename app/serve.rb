#!/usr/bin/env ruby

# Add lib to path
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")

# Standard Library
require 'optparse'

# Load Serve
require 'serve'

# Directories and Markdown parser
#
#  Default: kramdown
#   Others: redcarpet, rdiscount or maruku
#
options = {
  :content  => "content",
  :template => "template",
  :static   => "static",
  :parser   => "kramdown"
}

# Options
OptionParser.new do |opt|
  opt.banner = "Usage: serve [options]"

  opt.on("-c", "--content DIRECTORY", "Content directory") do |c|
    options[:content] = c
  end

  opt.on("-t", "--template DIRECTORY", "Template directory") do |t|
    options[:template] = t
  end

  opt.on("-s", "--static DIRECTORY", "Static directory") do |s|
    options[:static] = s
  end

  opt.on("-p", "--parser GEM", "kramdown, redcarpet, rdiscount or maruku") do |p|
    options[:parser] = p
  end
end.parse!

# Run Serve with the given arguments
Serve::Init.start(options[:content], options[:template], options[:static], options[:parser])
