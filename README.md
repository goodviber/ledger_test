# Work simulation task

Your task is to write some code that processes transactions from a ledger (see `example_ledger.csv`). Every line in the ledger represents a transfer of money from one account to another account.

The code should be able to answer:

- What's the balance of a given account at the end of a given date?

## Assumptions:

- All accounts start with a balance of zero
- The ledger could have millions of rows

## Important:

**You should approach this as if the code will become part of a live, production system.**

## `example_ledger.csv`

```
date,from,to,amount
2020-01-16,james,alice,25.00
2020-01-17,james,heather,20.00
2020-01-18,heather,james,100.00
2020-01-20,alice,heather,84.00
```

`bundle install`
`rake generate_ledger` to generate csv file
`rake run[ledger.csv <account_name> <query_date>]` to run application
`rspec spec` to run tests
