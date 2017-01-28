require_relative '../spec_helper'

describe 'When a user visits /horses' do
  it 'they see a list of all horses' do
    jockey  = Jockey.create(name: "Chindo")
    breed   = Breed.create(name: "Palomino")
    horse_1 = jockey.horses.create(name: "Jessica", age: 2, total_winnings: 4, breed: breed)
    horse_2 = jockey.horses.create(name: "Jorge", age: 3, total_winnings: 3, breed: breed)

    visit('/horses')

    within('table') do
      expect(page).to have_content(horse_1.name)
      expect(page).to have_content(horse_2.name)
      expect(page).to have_content(horse_1.breed.name)
      expect(page).to have_content(horse_1.jockey.name)
    end
  end
end
