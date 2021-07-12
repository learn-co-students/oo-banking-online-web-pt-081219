class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  @@accounts = []

  def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = "open"
    @@accounts << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance.positive?
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

  def enough_funds?(debit_amount)
    @balance > debit_amount
  end
end
