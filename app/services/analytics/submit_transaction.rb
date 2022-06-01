module Analytics
  class SubmitTransaction
    def call(order)
      return unless Analytics::TrackingConfig.enabled?

      tracker = Analytics::TrackingConfig.client
      pageview = build_pageview(tracker)

      order.line_items.each_with_index do |line_item, i|
        add_product_details(pageview, line_item, i)
      end

      add_transaction_details(pageview, order)

      pageview.track!
    end

    private

    def build_pageview(tracker)
      tracker.build_pageview(
        path: '/order/confirm',
        hostname: '',
        title: 'Order confirmed',
        product_action: 'purchase'
      )
    end

    def add_product_details(pageview, line_item, index)
      pageview.add_measurement(:product, {
        index: index + 1,
        sku: line_item.sku,
        name: line_item.product.name,
        category: line_item.product.category&.name,
        variant: line_item.variant.descriptive_name,
        quantity: line_item.quantity,
        price: line_item.price
      })
    end

    def add_transaction_details(pageview, order)
      pageview.add_measurement(:transaction, {
        transaction_id: order.number,
        revenue: order.total,
        tax: order.tax_total,
        shipping: order.ship_total,
        currency: order.currency
      })
    end
  end
end
