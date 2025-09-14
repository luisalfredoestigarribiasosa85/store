class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @product = params[:product]
    @subscribers = @product.subscribers

    @subscribers.each do |subscriber|
      @subscriber = subscriber
      mail(
        to: subscriber.email,
        subject: "Product Back In Stock",
        params: { subscriber: subscriber }
      )
    end
  end
end
