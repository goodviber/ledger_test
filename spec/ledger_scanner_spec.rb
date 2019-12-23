require 'spec_helper'
require 'ledger_scanner'
require 'byebug'

describe LedgerScanner do
  subject { LedgerScanner.new('ledger.csv') }

  it "instantiates a LedgerScanner" do
    expect(subject).to be_an_instance_of(LedgerScanner)
  end

  it "responds to scan method with 2 arguments" do
    expect(subject).to respond_to(:scan).with(2).arguments
  end

  it "responds to print_results method with 3 arguments" do
    expect(subject).to respond_to(:print_results).with(3).arguments
  end

  context ".scan method" do
    context "when query name and date are in ledger" do
      it "outputs a numeric result" do
        expect { subject.scan("james", "2020-01-31") }.to output("54.54\n").to_stdout
      end
    end

    context "when query date is before any ledger date" do
      it "returns date error message" do
        expect { subject.scan("james", "2019-01-31") }.to output("Query Date is not in ledger\n").to_stdout
      end
    end

    context "when query date is before any ledger date" do
      context "with name in ledger" do
        it "returns date error message" do
          expect { subject.scan("james", "2019-01-31") }.to output("Query Date is not in ledger\n").to_stdout
        end
      end
    end

    context "when query name is not in ledger with valid date" do
      it "returns name error message" do
        expect { subject.scan("noname", "2020-01-31") }.to output("Query Name is not in ledger\n").to_stdout
      end
    end
  end

end
