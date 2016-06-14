class Transaction
    attr_reader :id, :customer, :product
    @@transactions = []
    @@id = 1

    def initialize(customer, product)
        @customer = customer
        @product = product
        @id = @@id
        @@id += 1
        @product.decrease_stock
        add_to_transactions
    end

    def self.all
        @@transactions
    end

    def self.find(id)
        @@transactions.each do |transaction|
            if transaction.id == id
                return transaction
            end
        end
    end

    private

    def add_to_transactions
        @@transactions << self
    end

end
