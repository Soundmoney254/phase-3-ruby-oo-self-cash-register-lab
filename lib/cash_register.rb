class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        record_items(title, quantity)
        update_last_transaction(price, quantity)
    end

    def apply_discount
        if discount > 0
        apply_discount_to_total
        "After the discount, the total comes to $#{total}."
        else
        "There is no discount to apply."
        end
    end

    def record_items(title, quantity)
        quantity.times { items << title }
    end

    def update_last_transaction(price, quantity)
        self.last_transaction = price * quantity
    end

    def apply_discount_to_total
        self.total -= (total * (discount / 100.0)).to_i
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end
