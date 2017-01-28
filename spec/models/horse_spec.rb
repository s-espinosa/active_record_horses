require_relative '../spec_helper'

RSpec.describe Horse do
  describe ".total_winnings" do
    it "returns total winnings for all horses" do
      Horse.create(name: "Phil", age: 22, total_winnings: 3)
      Horse.create(name: "Penelope", age: 24, total_winnings: 4)

      expect(Horse.total_winnings).to eq(7)
    end

    it "returns total winnings for only one jockey" do
      kurt = Jockey.create(name: "Kurt")
      razz = Jockey.create(name: "Razz")
      kurt.horses.create(name: "Phil", age: 22, total_winnings: 3)
      razz.horses.create(name: "Penelope", age: 24, total_winnings: 4)

      expect(kurt.horses.total_winnings).to eq(3)
      expect(razz.horses.total_winnings).to eq(4)
    end
  end

  describe '.average_winnings' do
    it "returns average winnings for all horses" do
      Horse.create(name: "Phil", age: 22, total_winnings: 3)
      Horse.create(name: "Penelope", age: 24, total_winnings: 4)

      expect(Horse.average_winnings).to eq(4)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      horse = Horse.new(age: 22, total_winnings: 14)

      expect(horse).to_not be_valid
    end

    it "is invalid without total winnings" do
      horse = Horse.new(name: "Fred", age: 22)

      expect(horse).to_not be_valid
    end
  end
end
# require 'pry';binding.pry
