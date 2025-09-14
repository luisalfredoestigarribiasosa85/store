require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    mail = ProductMailer.with(product: products(:PS4), subscriber: subscribers(:one)).in_stock
    assert_equal "Product Back In Stock", mail.subject
    assert_equal [ "two@example.com" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Good news!", mail.body.encoded
  end
end
