require 'pry'
class Transfer

attr_accessor :sender, :amount, :receiver, :status 

  def initialize(sender, receiver, amount)
     @sender = sender 
     @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if  @sender.valid? && @receiver.valid? && @sender.balance >= @amount
      true 
    else 
      false
    end
  end

  def execute_transaction 
      if  !valid?  # this is saying to check if not valid and do this else..other code
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
     
        elsif @status == "pending" # three things..rejected..pending and complete thats why elseif. 
       @sender.balance -= @amount
       @receiver.balance += @amount
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


#  def valid?
#if  @sender.valid? && @receiver.valid? && @sender.balance >= @amount
# |
# |
# v
# if  @sender.valid? && @receiver.valid? checking to see if  sender and reciever have open account and money
 #@sender.balance >= @amount checking to see if sender has enough money to send
  
  
  
  
  