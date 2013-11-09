# encoding: utf-8

require "spec_helper"

describe "正常終了" do

  subject{ lambda{ `bundle exec ruby bin/analyze.rb fruits.log`} }
  
  it { should_not raise_error }

  it "正常ステータスで終了すること" do
    $?.success?.should eq true
  end

end

describe "count_fruits" do
  pending ここに追加
end

describe "create_delemeter_position_array" do
  pending ここに追加
end

