describe "user visits items edit page"  do
  context "visit [items/1/edit]"  do
    it "they fill in edit form and then clicks submit and sees edited item"  do
      Item.create!(name: "super toy", description: "its fun", unit_price: 1)

       visit '/items/1/edit'

       fill_in("item[name]", with: "toy")
       fill_in("item[unit_price]", with: 2 )
       save_and_open_page
       click_button("Submit")

       expect(page).to have_content("toy")
       expect(page).to have_content("fun")
       expect(page).to have_content(2)

     end
   end
 end
