module Spree
  Order.class_eval do
    state_machine do
      after_transition :to => :complete, :do => :submit_to_analytics
    end

    private

    def submit_to_analytics
      command = Analytics::SubmitTransaction.new
      command.call(self)
    end
  end
end
