#!/usr/bin/env ruby
# enconding: utf-8

# @param ARGV[0] 入力データファイル名

DELEMETERS= [ "[", "]", "(", ")", "{", "}" ]

if ARGV[0].nil?
  puts "usage: bundle exec ruby bin/analyze.rb [input file]"; exit 1
end

unless File.exists?( ARGV[0] )
  puts "no such file #{ARGV[0]}"; exit 1
end

# 組となる区切り文字の位置の配列を返す
# @param  [String] str 1行分の入力文字列
# @return [Array] positionの配列. 例) [ [1, 2], [3, 5] ]
def create_delemeter_position_array( str )
  pos_arr = []
end

# 入力文字列からフルーツをカウントする
# @param [String] 文字列. 最初と最後のdelemeterが削除されているものを想定
# @return [Fixnum] フルーツの数
def count_fruits( str )
  # @todo あとで区切り文字は置換えられるようにする
  str.clone.delete("[](){}").split(" ").count
end

File.open( ARGV[0] ) do |file|
  while line = file.gets
    p line
    p count_fruits( line.chomp )
  end
end


