  describe "User visits items dashboard"  do
    context "Visits [/items-dashboard]"  do
      it "They see total count of items"  do
        Item.create(name: "fun toy", description: "Its fun", unit_price: 10, merchant_id: 1, image: "somelink")
        Item.create(name: "fun toy", description: "Its fun", unit_price: 40, merchant_id: 1, image: "somelink")
        Item.create(name: "toy", description: "fun", unit_price: 20, merchant_id: 1, image: "somelink")

        visit '/items-dashboard'


        expect(page).to have_content(3)
      end
    end
  end

  describe "User visits items dashboard"  do
    context "Visits [/items-dashboard]"  do
      it "They see total count of items"  do
        Item.create(name: "bear", description: "fuzzy", unit_price: 10, merchant_id: 1, image: "somelink")
        Item.create(name: "fox", description: "grey", unit_price: 40, merchant_id: 1, image: "somelink")
        Item.create(name: "snake", description: "oh no", unit_price: 20, merchant_id: 1, image: "somelink")
        Item.create(name: "pig", description: "bacon", unit_price: 10, merchant_id: 1, image: "somelink")
        Item.create(name: "trump", description: "A joke", unit_price: 40, merchant_id: 1, image: "somelink")
        Item.create(name: "plane", description: "flying", unit_price: 20, merchant_id: 1, image: "somelink")

        visit '/items-dashboard'


        expect(page).to have_content(6)
      end
    end
  end

  describe "User visits items dashboard"  do
    context "Visits [/items-dashboard]"  do
      it "They see average count of items"  do
        Item.create(name: "fun toy", description: "Its fun", unit_price: 20, merchant_id: 1, image: "somelink")
        Item.create(name: "fun toy", description: "Its fun", unit_price: 20, merchant_id: 1, image: "somelink")
        Item.create(name: "toy", description: "fun", unit_price: 20, merchant_id: 1, image: "somelink")

        visit '/items-dashboard'

        save_and_open_page
        expect(page).to have_content(20.0)
      end
    end
  end
