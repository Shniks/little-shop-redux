
  describe 'user visits items/new'  do
    it 'they see the form for the new item'  do

      visit 'items/new'

      expect(page).to have_content(" Enter a item name ")
      expect(page).to have_content("Enter a item description:")
      expect(page).to have_content("Enter a item unit-price")
      expect(page).to have_button("Submit")
    end
  end
