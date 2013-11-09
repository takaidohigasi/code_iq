#!/usr/bin/env ruby
# encoding: utf-8

# @param ARGV[0] 入力データファイル名

# DELEMETERS= [  ["[", "]"], ["(", ")"], ["{", "}"] ]

if ARGV[0].nil?
  puts "usage: bundle exec ruby bin/analyze.rb [input file]"; exit 1
end

unless File.exists?( ARGV[0] )
  puts "no such file #{ARGV[0]}"; exit 1
end

# 組となる区切り文字の位置の配列を返す
# @param  [String] line_str 1行分の入力文字列
# @return [Array] positionの配列. 例) [ [1, 2], [3, 5] ]
def create_delemeter_position_array( line_str )
  pos_arr = []

  pos = 0
  # "[", "{", "(" の位置をベースに、区切り文字の位置を探索
  # @note このままだと、閉じ括弧が明らかに少ない場合に性能的に不利
  while ( pos = line_str.index(/([\(\{\[])/, pos) ) && !pos.nil?
    # 対応する括弧を規定
    closing_parenthesis =
      case $1
        when "{"
          "}"
        when "("
          ")"
        when "["
          "]"
      end
    closing_pos = line_str.index(closing_parenthesis, pos)
    pos_arr.push([pos, closing_pos]) unless closing_pos.nil?

    # 見つかった場所の次から探索を再度開始
    pos += 1
  end

  pos_arr
end

# 入力文字列からフルーツをカウントする
# @param  [String] 文字列. 最初と最後のdelemeterが削除されているものを想定
# @return [Fixnum] フルーツの数
def count_fruits( str )
  # @todo あとで区切り文字は置換えられるようにする
  str.clone.gsub(/[\[\]\(\)\{\}]/, " ").squeeze(" ").split(" ").count
end


# 改行のないテキストの最大フルーツ数を返す
# @param  [String] line_str 入力文字列
# @return [Fixnum] 最大フルーツ数
def max_fruits_num_of_line( line_str )
  max = 0
  create_delemeter_position_array( line_str ).each do |pos|
    # 区切り文字を除いた場所を指定
    cnt = count_fruits(line_str[pos[0]..pos[1]])
    max = cnt if cnt > max
  end
  max
end

File.open( ARGV[0] ) do |file|
  while line = file.gets
    p max_fruits_num_of_line( line.chomp )
  end
end

