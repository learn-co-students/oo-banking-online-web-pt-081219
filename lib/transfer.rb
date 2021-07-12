class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  @@transfers = []

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @executed = false
    @@transfers << self
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_internal
    if @executed == true
      "Sorry, happened already!"
    else
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      @executed = true
    end
  end

  def execute_transaction
    if valid? && @sender.enough_funds?(@amount)
      execute_internal
    else
      @status = "rejected"
      @executed = false
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @executed == true
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    else
      "Sorry, this hasn't happened yet."
    end
  end
end
