class Transfer
  attr_accessor :sender, :amount, :status, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount
       @status == "complete"
      return "Transaction was already executed"
    elsif
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.deposit( @amount * -1 )
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end
