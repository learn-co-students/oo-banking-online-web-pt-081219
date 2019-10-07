class Transfer
  
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  
   # let(:avi) { BankAccount.new("Avi") }
   # let(:amanda) { BankAccount.new("Amanda") }
   # let(:transfer) { Transfer.new(amanda, avi, 50) }
   # let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

   # it "can execute a successful transaction between two accounts" do
   #   transfer.execute_transaction
   #  expect(amanda.balance).to eq(950)
   #  expect(avi.balance).to eq(1050)
   #   expect(transfer.status).to eq("complete")
  
  def execute_transaction
    #execute successful transaction between 2 accts
    #each transfer can only happen once
    #rejects a transfer if the sender does not have enough funds (does not have a valid account)
    
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    #reverse
    #can only reverse executed transfers
  end

end