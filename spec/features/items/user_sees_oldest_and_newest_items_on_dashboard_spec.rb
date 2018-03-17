describe "User visits items dashboard"  do
  context "Visits [/items-dashboard]"  do
    it "They see oldest item"  do
      Item.create(name: "bear", description: "Its fun", unit_price: 10, merchant_id: 1, image: "somelink")
      Item.create(name: "gi joe", description: "Its fun", unit_price: 40, merchant_id: 1, image: "somelink")
      Item.create(name: "toy", description: "fun", unit_price: 20, merchant_id: 1, image: "somelink")

      visit '/items-dashboard'


      expect(page).to have_content("bear")
    end
  end
end

describe "User visits items dashboard"  do
  context "Visits [/items-dashboard]"  do
    it "They see newest item"  do
      Item.create(name: "bear", description: "Its fun", unit_price: 10, merchant_id: 1, image: "somelink")
      Item.create(name: "gi joe", description: "Its fun", unit_price: 40, merchant_id: 1, image: "somelink")
      Item.create(name: "toy", description: "fun", unit_price: 20, merchant_id: 1, image: "somelink")

      visit '/items-dashboard'


      expect(page).to have_content("toy")
    end
  end
end
