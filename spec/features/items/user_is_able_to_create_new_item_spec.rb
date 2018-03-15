  describe "user visits items new page"  do
    context "visit [items/new]"  do
      it "they fill in new form and is clicks submit and sees new item"  do

         visit '/items/new'

         fill_in("item[name]", with: "super toy")
         fill_in("item[description]", with: "its fun")
         fill_in("item[unit_price]", with: 2 )

         click_button("Submit")

         expect(page).to have_content("super toy")
         expect(page).to have_content("its fun")
         expect(page).to have_content(2)

       end
     end
   end

   describe "user visits items new page"  do
     context "visit [items/new]"  do
       it "they fill in new form and is clicks submit and sees new item on show page"  do

          visit '/items/new'

          fill_in("item[name]", with: "terminator")
          fill_in("item[description]", with: "death")
          fill_in("item[unit_price]", with: 1000 )

          click_button("Submit")

          expect(page).to have_content("terminator")
          expect(page).to have_content("death")
          expect(page).to have_content(1000)

        end
      end
    end
