# encoding: utf-8

require "spec_helper"
require "analyze"

describe "正常終了" do

  subject{ lambda{ `bundle exec ruby bin/analyze.rb fruits.log`} }
  
  it { should_not raise_error }

  it "正常ステータスで終了すること" do
    $?.success?.should eq true
  end

end

describe "count_fruits" do
  
  subject{ count_fruits(input) }

  context "入力が apple strawberry (melon [ apple ) のとき" do
    let(:input){ "apple strawberry (melon [ apple )" }
    it { should eq 4 }
  end

  context "入力が melon [ apple  のとき" do
    let(:input){ "melon [ apple " }
    it { should eq 2 }
  end

end

describe "create_delemeter_position_array" do

  subject{ create_delemeter_position_array(input) }

  context "入力が{apple strawberry (melon [ apple )}のとき" do
    let(:input){ "{apple strawberry (melon [ apple )}" }
    it { should eq [ [0, 34], [18, 33]] }
  end

end

