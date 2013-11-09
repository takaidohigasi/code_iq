# encoding: utf-8

# rspec default settings
# -------------------------------------------------
RSpec.configure do |c|
  c.fail_fast = true
end

# configure load path
# -------------------------------------------------
here = File.dirname(__FILE__)
$:.unshift File.expand_path("../lib", here)
$:.unshift File.expand_path("../bin", here)
$:.unshift File.dirname(__FILE__)
