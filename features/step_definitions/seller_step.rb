
Given("no seller exists with an email of {string}") do |string|
    Seller.find_by_email(string).should be_nil
end

Given("A seller is signed up and confirmed as {string},{string},{string}") do |username, email, password|
    Seller.create(username: username, email: email, password: password, password_confirmation: password)
end

Given("A registered seller as {string},{string},{string}") do |username, email, password|
    Seller.create(username: username, email: email, password: password, password_confirmation: password)
    visit new_seller_session_path
    fill_in 'seller_email', :with => email
    fill_in 'seller_password', :with => password
    click_button 'Log in'
end



When("A seller go to the {string} page") do |page|
    visit page
end


When("The seller sign in as {string},{string}") do |email, password|
    fill_in 'seller_email', :with => email
    fill_in 'seller_password', :with => password
    click_button 'Log in'
end


When("A seller click the {string} link") do |link|
        click_link link
end

When("The seller should be in the {string}") do |page|
    expect(current_path).to eql page

end

When("The seller should fill in {string},{string},{string},{string},{string},{string}") do |title,price,category,condition,descrtiption,sold|
    fill_in 'announcement[title]', :with => title
    fill_in 'announcement[price]', :with => price
    page.select category, from: 'announcement[category]'
    page.select condition, from: 'announcement[condition]'
    page.select sold, from: 'announcement[sold]'
    attach_file('announcement[image]', 'C:\Users\Marco\Immagini\Screenshot\tv.jpg')


    

end

Then("The seller should see his features") do
    within("div#features") do
        true
    end
    save_and_open_page
end





Then("The seller should be to redirect to {string}") do |page|
    expect(current_path).to eql page

    

end