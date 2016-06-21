class Product
    attr_reader :title, :price, :stock
    @@products = []
    @@in_stock = []

    def initialize(options={})
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        add_to_products
    end

    def self.all
        @@products
    end

    def self.in_stock
        @@products.each do |product|
            if product.in_stock?
                @@in_stock << product
            end
        end
        return @@in_stock
    end

    def in_stock?
        @stock > 0
    end

    def decrease_stock
        @stock -= 1
    end

    def increase_stock
        @stock += 1
    end

    def self.find_by_title(title)
        @@products.each do |product|
            if product.title == title
                return product
            end
        end
    end

    private

    def add_to_products
        @@products.each do |product|
            if product.title == self.title
                raise DuplicateProductError, "#{self.title} already exists."
            end
        end
        @@products << self
    end
end
