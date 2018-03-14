describe 'user vists merchant index' do
  it 'it sees the header' do
    Merchant.create(name: "Tyler")
    visit '/merchants'
    expect(page).to have_content("Tyler")
  end
end
