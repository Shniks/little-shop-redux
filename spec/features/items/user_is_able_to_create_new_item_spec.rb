  describe "User visits items new page"  do
    context "User visits [items/new]"  do
      it "User fills in a new form and clicks submit and sees new item"  do

         visit '/items/new'

         fill_in("item[name]", with: "super toy")
         fill_in("item[description]", with: "its fun")
         fill_in("item[unit_price]", with: 2 )

         click_button("Submit")

         expect(page).to have_content("super toy")
         expect(page).to have_content(2)

       end
     end
   end

   describe "User visits items new page"  do
     context "User visits [items/new]"  do
       it "User fills in new form and clicks submit and sees new item on show page"  do

          visit '/items/new'

          fill_in("item[name]", with: "terminator")
          fill_in("item[description]", with: "death")
          fill_in("item[unit_price]", with: 1000 )


          click_button("Submit")

          expect(page).to have_content("terminator")
          expect(page).to have_content(1000)
        end
      end
    end
