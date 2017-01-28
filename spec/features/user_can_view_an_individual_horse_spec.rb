require_relative '../spec_helper'

describe 'When a user visits /jockeys/:id' do
  it 'they can see the total and average winnings for an individual jockey' do
    jockey = Jockey.create(name: "Chava")
    breed  = Breed.create(name: "Palomino")
    jockey.horses.create(name: "Justin", age: 2, total_winnings: 4, breed: breed)
    jockey.horses.create(name: "Jane", age: 3, total_winnings: 2, breed: breed)

    visit "/jockeys/#{jockey.id}"

    expect(page).to have_content("Total Winnings: 6")
    expect(page).to have_content("Average Winnings: 3")
  end
end
