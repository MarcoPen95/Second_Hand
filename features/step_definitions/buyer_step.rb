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
    if link =="Favorites" 
        click_link link 
    end
end


Then("The buyer should be to redirect to {string}") do |page|
    expect(current_path).to eql page
end
