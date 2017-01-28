require_relative '../spec_helper'
require_relative 'load_database'

include LoadDatabase


describe "When a user vists root" do
  it "they see a greeting" do
    visit('/')
    within('#greeting') do
      expect(page).to have_content('Welcome!')
    end
  end
end

describe 'when a user visits/jockeys/:id' do
  it 'has a report of total winnings' do
    LoadDatabase.load

    jockey_ids = (1..LoadDatabase.jockeys.length).to_a
    jockey_ids.each do |id|
      jockey = Jockey.find(id)
      visit("/jockeys/#{id.to_s}")

      expect(page).to have_content("Total Winnings")
      expect(page).to have_content(jockey.horses.total_winnings)
      expect(page).to have_content("Average Winnings")
      expect(page).to have_content(jockey.horses.average_winnings)
    end
  end
end
