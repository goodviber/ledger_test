require 'spec_helper'
require 'account_calc'
require 'byebug'

describe AccountCalc do
  let(:line) { ["2020-01-31", "mary", "john", "30.03"] }
  subject { AccountCalc.new(line) }

  it "is alive!" do
    expect(subject).to be_an_instance_of(AccountCalc)
  end

  it "responds to return_line_balance method with 1 argument" do
    expect(subject).to respond_to(:return_line_balance).with(1).argument
  end

  it "responds to return_line_name_count 1 argument" do
    expect(subject).to respond_to(:return_line_name_count).with(1).argument
  end

  context ".return_line_balance" do
    it "correctly calculates a balance transfer from one name to another" do
      expect(subject.return_line_balance("mary")).to eq(-30.03)
      expect(subject.return_line_balance("john")).to eq(30.03)
    end
  end

  context ".return_line_name_count" do
    it "checks for the prescence of the query name" do
      expect(subject.return_line_name_count("no name")).to eq(0)
      expect(subject.return_line_name_count("mary")).to eq(1)
      expect(subject.return_line_name_count("john")).to eq(1)
    end
  end
end
