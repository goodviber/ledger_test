require 'csv'
require 'bigdecimal'
require_relative 'account_calc'
require 'byebug'

class LedgerScanner

  def initialize(ledger)
    @ledger = ledger
  end

  def scan(name, date)
    parsed_date = Date.parse(date)
    sum = BigDecimal("0")
    name_present = 0
    date_count = 0
    CSV.foreach(@ledger, headers: true) do |line|
      if Date.parse(line[0]) <= parsed_date
        balance = AccountCalc.new(line).return_line_balance(name)
        sum += BigDecimal(balance)
        name_count = AccountCalc.new(line).return_line_name_count(name)
        name_present += name_count
        date_count += 1
      end
    end
    print_results(sum, name_present, date_count)
  end

  def print_results(sum, name_present, date_count)
    if date_count == 0
      puts "Query Date is not in ledger"
    elsif name_present == 0
      puts "Query Name is not in ledger"
    else
      puts sum.truncate(2).to_s('F')
    end
  end

end
