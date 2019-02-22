# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_completion.subject
  #
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/order_completion
  def order_completion(order, products, items)
    @order = order
    @products = products
    @items = items
    mail to: @order.email, subject: "Your Order from Jungle! Order ID: #{@order.id}"
  end
end
