require_relative '../spec_helper'

describe 'When a user visits /horses/new' do
  it 'they can create a new horse' do
    Jockey.create(name: "Chema")
    Breed.create(name: "Palomino")

    visit '/horses/new'
    fill_in 'horse[name]', with: Faker::Cat.name
    fill_in 'horse[total_winnings]', with: Faker::Number.number(5)
    select 'Chema', from: 'horse[jockey_id]'
    select 'Palomino', from: 'horse[breed_id]'
    click_on 'Create New Horse'

    horse = Horse.last
    expect(current_path).to eq("/horses/#{horse.id}")
    expect(page).to have_content(horse.name)
    expect(page).to have_content(horse.total_winnings)
    expect(Horse.count).to eq(1)
  end
end
