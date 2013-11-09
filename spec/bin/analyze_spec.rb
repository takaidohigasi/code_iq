# encoding: utf-8

require "spec_helper"

describe "正常終了" do

  subject{ lambda{ `bundle exec ruby bin/analyze.rb`} }
  
  it { should_not raise_error }

  it "正常ステータスで終了すること" do
    $?.success?.should eq true
  end

end

