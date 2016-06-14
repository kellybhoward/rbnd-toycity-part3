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
