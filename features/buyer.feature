Feature: Buyer features

    Scenario: Buyer is not signed up
        Given no buyer exists with an email of "email@person.com"
        When A buyer go to the "/buyers/sign_in" page
        And The buyer sign in as "email@person.com", "password"
        Then The buyer should be to redirect to "/buyers/sign_in"

    Scenario: Buyer signs in successfully
        Given A buyer is signed up and confirmed as "username", "email@person.com", "password"
        When A buyer go to the "/buyers/sign_in" page
        And The buyer sign in as "email@person.com", "password"
        Then The buyer should be to redirect to "/"

    Scenario: As a Buyer I want to ACCESS MY FAVORITES so that I can DISPLAY ALL MY FAVORITES
        Given A registered buyer as "username", "email@person.com", "password"
        When A buyer go to the "/" page
        And A buyer click the "Favorites" link
        Then The buyer should be to redirect to "/buyer/my_favorites"

    Scenario: As a Buyer I want to ACCESS MY PURCHASES so that I can DISPLAY ALL MY PURCHASES
        Given A registered buyer as "username", "email@person.com", "password"
        When A buyer go to the "/" page
        And A buyer click the "My Purchases" link
        Then The buyer should be to redirect to "/buyer/my_purchases"
    
    Scenario: As a Buyer I want to SEARCH AN ANNOUNCEMENT so that I can FIND THOSE I'M INTERESTED by filtering their name,category 
        Given A registered buyer as "username", "email@person.com", "password"
        When A buyer go to the "/" page
        And A buyer click the "Search" link
        And A buyer go to the "/searches/new" page
        And The buyer should fill in "xiaomi","Telephony"
        And A buyer click the "Search" button
        Then The "email@person.com" should see the search result page       

    Scenario: As a Buyer I want to HAVE A FAVORITES LIST so that I can ADD AN ANNOUNCEMENT TO MY FAVORITES
        Given A registered buyer as "username", "email@person.com", "password"
        When The buyer haven't a "favorite"
        And An "email@person.com" go to the announcement+id page
        Then The buyer should be able to favorite an "announcement"

    Scenario: As a Buyer I want to HAVE A CREATE TRANSACTION FORM so that I CAN BUY AN OBJECT OF AN ANNOUNCEMENT
        Given A registered buyer as "username", "email@person.com", "password"
        When The buyer haven't a "purchase"
        And An "email@person.com" go to the announcement+id page
        And A buyer click the "Acquista" button
        And The "email@person.com" should see the purchase form page  
        And The buyer should fill the purchase form in "4242424242424242","04/22","4242"

