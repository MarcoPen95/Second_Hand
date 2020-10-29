Given("no buyer exists with an email of {string}") do |string|
    Buyer.find_by_email(string).should be_nil
end


Given("A buyer is signed up and confirmed as {string}, {string}, {string}") do |username, email, password|
    Buyer.create(username: username, email: email, password: password, password_confirmation: password)
end

Given("A registered buyer as {string}, {string}, {string}") do |username, email, password|
    Buyer.create(username: username, email: email, password: password, password_confirmation: password)
    visit new_buyer_session_path
    fill_in 'buyer_email', :with => email
    fill_in 'buyer_password', :with => password
    click_button 'Log in'
end

When("A buyer go to the {string} page") do |page|
    visit page
end

When("The buyer sign in as {string}, {string}") do |email, password|
    fill_in 'buyer_email', :with => email
    fill_in 'buyer_password', :with => password
    click_button 'Log in'
end


When("A buyer click the {string} link") do |link|
    if link == "Favorites" || link == "My Purchases" || link == "Searches" 
        click_link link 
    end
end

When("A buyer click the {string} button") do |button|
    click_button(button)
    save_and_open_page

end



When("The buyer should fill in {string},{string}") do |title,category|
    fill_in 'search[title]', :with => title
    page.select category, from: 'search[category]'
    @search = Search.create(title: title, category: category)
end

When("The buyer should fill the purchase form in {string},{string},{string}") do |cardnumber,expdate,cvc|
    fill_in 'cardnumber', :with => cardnumber
    fill_in 'exp-date', :with => expdate
    fill_in 'cvc', :with => cvc
    save_and_open_page
end




When ("The buyer haven't a {string}") do |string|
    if string == "favorite" || string == "purchase"
        @seller = Seller.create(username: "seller1", email: "test@test.com", password: "password", password_confirmation: "password")
        @announcement = Announcement.create(title: "t1", image:"download.jpg", category: "Books", price: "25", description: "desc", seller_id: @seller.id)


    end
end

When("An {string} go to the announcement+id page") do |email|
    @buyer = Buyer.find_by_email(email)
    @id = @announcement.id
    visit "/announcements/"+@id.to_s
    save_and_open_page

end

When("The {string} should see the purchase form page") do |email|
    @buyer = Buyer.find_by_email(email)
    @id = @announcement.id
    @price = @announcement.price
    visit "/purchases/new?amount="+@price.to_s+"&announcement="+@id.to_s
    save_and_open_page
    

end

Then("The {string} should see the search result page") do |email|
    @buyer = Buyer.find_by_email(email)
    @id = @search.id
    visit "/searches/"+@id.to_s
    save_and_open_page

end





Then("The buyer should be to redirect to {string}") do |page|
    expect(current_path).to eql page
end

Then("The buyer should be able to favorite an {string}") do |string|
    
    click_link("Aggiungi ai preferiti")
   
    
end









Then("The buyer should be ") do
    within("div#favorites") do
        true
    end
end 
