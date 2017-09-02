require 'awesome_print'
# Class for handling wallets
class Wallet
  # construct
  def initialize(money, password)
    @password = password
    modify_money(money, password)
  end

  def to_hash
    { money: @money }
  end

  def receive_money(balance, password)
    modify_money(balance + @money, password)
  end

  def take_money(balance, password)
    modify_money(@money - balance, password)
  end

  private

  def modify_money(new_balance, password)
    validate_key(password)
    raise('NegativeBalance') if new_balance < 0
    @money = new_balance
  end

  def validate_key(password)
    raise('WrongKey') if password != @password
  end
end

wallet = Wallet.new(1000, 'pass')
ap(wallet.to_hash)

wallet.receive_money(100, 'pass')
ap(wallet.to_hash)

wallet.take_money(200, 'pass')
ap(wallet.to_hash)

begin
  ap(wallet.receive_money(100, ''))
rescue => ex
  ap(message: ex.message, trace: ex.backtrace)
end

begin
  ap(wallet.take_money(10_000, 'pass'))
rescue => ex
  ap(message: ex.message, trace: ex.backtrace)
end
