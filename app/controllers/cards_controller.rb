class CardsController < ApplicationController
  require "payjp"

  def new
    @set_card = Card.where(user_id: current_user.id)
    redirect_to action: "up" if @set_card.exists?
  end

  def pay
   
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, order_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action:"up"
      else
        redirect_to action:"pay"
      end
    end
  end


  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.order_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end
  def show
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    order = Payjp::Customer.retrieve(card.order_id)
    @default_card_information = order.cards.retrieve(card.card_id)
  end

  def up
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      order = Payjp::Customer.retrieve(card.order_id)
      @default_card_information = order.cards.retrieve(card.card_id)
    end
  end

end
