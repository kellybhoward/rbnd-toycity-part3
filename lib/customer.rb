class Customer
    attr_reader :name
    @@customers = []

    def initialize(options={})
        @name = options[:name]
        add_to_customers
    end

    def self.all
        @@customers
    end

    def self.find_by_name(name)
        @@customers.each do |customer|
            if customer.name == name
                return customer
            end
        end
    end

    def purchase(product)
        if product.in_stock?
            Transaction.new(self, product)
        else
            raise OutOfStockError, "#{product.title} is out of stock."
        end
    end

    def reject(product)
        Reject.new(self, product)
    end

    private

    def add_to_customers
        @@customers.each do |customer|
            if customer.name == self.name
                raise DuplicateCustomerError, "#{self.name} already exists."
            end
        end
        @@customers << self
    end
end
