class Transaction
    attr_reader :id, :customer, :product, :purchase_timestamp
    @@transactions = []
    @@id = 1

    def initialize(customer, product)
        @customer = customer
        @product = product
        @id = @@id
        @@id += 1
        @purchase_timestamp = Time.now.utc
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

    def display_time
        puts "This item was purchased on: " + @purchase_timestamp.strftime("%B %e, %Y at %I:%M %p")
    end

    private

    def add_to_transactions
        @@transactions << self
    end

end
