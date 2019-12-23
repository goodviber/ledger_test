require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Generate a CSV file of ledger data"
  task :generate_ledger do

    require 'csv'
    headers = ["date", "from", "to", "amount"]

    CSV.open("ledger.csv", "wb", { write_headers: true, headers: headers } ) do |csv|
      csv << ["2020-01-16","james","alice","25.05"]
      csv << ["2020-01-17","james","heather","20.74"]
      csv << ["2020-01-18","heather","james","100.33"]
      csv << ["2020-01-20","alice","heather","84.00"]
    end

  end

desc 'Run Scanner'
  task :run, [:ledgerfile, :name, :date] do |t, args|

    project_root = File.dirname(File.absolute_path(__FILE__))
    Dir.glob(project_root + '/lib/*') { |file| require file }

    ledger = LedgerScanner.new(args[:ledgerfile])
    result = ledger.scan(args[:name], args[:date])

  end
