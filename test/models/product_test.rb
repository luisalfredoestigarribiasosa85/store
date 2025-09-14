require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    # Use a product fixture with subscribers
    product = products(:PS4)

    # Set product out of stock
    product.update!(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 99)
    end
  end
end
