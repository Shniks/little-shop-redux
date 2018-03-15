describe 'user visits merchant index' do
  it 'it sees the attribute' do
    Merchant.create(name: "Tyler")
    visit '/merchants'
    expect(page).to have_content("Tyler")
  end




end
