#!/usr/bin/env ruby
# enconding: utf-8

# @param ARGV[0] 入力データファイル名

if ARGV[0].nil?
  puts "usage: bundle exec ruby bin/analyze.rb [input file]"; exit 1
end

unless File.exists?( ARGV[0] )
  puts "no such file #{ARGV[0]}"; exit 1
end


