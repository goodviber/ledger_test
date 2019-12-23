require 'spec_helper'

describe Ledger do
  it 'has a version number' do
    expect(Ledger::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end
end
