class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  def display_balance
    p "Your balance is $#{@balance}."
  end
  
  def deposit(amount)
    @balance += amount
  end
  def close_account
    @status = "closed"
  end
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end
  
end
