require 'json'

module Finleap
  module Customers
    class Data
      def self.all
        IO.foreach('fixtures/finleap-connect-customers.json').map do |row|
          JSON.parse(row)
        end
      end
    end
  end
end

