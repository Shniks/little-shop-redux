
  describe 'User visits items/new'  do
    it 'User sees the form for a new item'  do

      visit '/items/new'

      expect(page).to have_content(" Enter a item name ")
      expect(page).to have_content("Enter a item description:")
      expect(page).to have_content("Enter a item unit-price")
      expect(page).to have_button("Submit")
    end
  end
