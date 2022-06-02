# frozen_string_literal: true
require 'rails_helper'

describe CarDealership do
  describe "#deliver_car" do
    let(:toyota_dealer) { CarDealership.new }
    context "failure" do
      it "does not deliver a car with the year less than 2000" do
        delivery = toyota_dealer.deliver_car(1990, 'Venza', 'red', 'Austin')
        expect(delivery.success).to eq nil
        expect(delivery.failure).to eq 'We have no cars manufactured in year 1990'
      end

      it "does not deliver a car with the year less than 2000" do
        delivery = toyota_dealer.deliver_car(2005, 'Venza', 'yellow', 'Austin')
        expect(delivery.success).to eq nil
        expect(delivery.failure).to eq 'Color yellow is unavailable'
      end
    end
    context "success" do
      it "delivers a car when all conditions are met" do
        delivery = toyota_dealer.deliver_car(2000, 'Avalon', 'blue', 'Austin')
        expect(delivery.success).to eq 'A blue 2000 Toyota Avalon will be delivered to Austin'
        expect(delivery.failure).to eq nil
      end
    end
  end
end