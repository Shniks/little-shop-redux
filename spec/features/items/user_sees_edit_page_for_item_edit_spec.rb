
  describe 'User enters edit page for item'  do
    it 'User sees all the fields for editing the item'  do
      Item.create(id: 1, name: "something fun", description: "oh yeah its fun", unit_price: 34, merchant_id:32, image: "some link")

      visit 'items/1/edit'

      expect(page).to have_content("Edit Item")
    end
  end
