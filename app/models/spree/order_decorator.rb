module Spree::OrderDecorator
  def self.prepended(klass)
    klass.class_eval do
      state_machine do
        after_transition to: :complete, do: :submit_to_analytics
      end
    end
  end

  private

  def submit_to_analytics
    command = Analytics::SubmitTransaction.new
    command.call(self)
  end
end

Spree::Order.prepend(Spree::OrderDecorator)
