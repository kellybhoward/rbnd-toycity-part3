class Reject
    attr_reader :id, :customer, :product
    @@rejects = []
    @@id = 1

    def initialize(customer, product)
        @customer = customer
        @product = product
        @id = @@id
        @@id += 1
        @product.increase_stock
        add_to_rejects
    end

    def self.all
        @@rejects
    end

    def self.find(id)
        @@rejects.each do |reject|
            if reject.id == id
                return reject
            end
        end
    end

    private

    def add_to_rejects
        @@rejects << self
    end

end
