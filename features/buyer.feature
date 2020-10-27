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
    
    Scenario: As a Buyer I want to HAVE MY FAVORITES so that I can ADD AN ANNOUNCEMENT 
        Given A registered buyer as "username", "email@person.com", "password"
        When A buyer go to the "/" page
        And A buyer click the "Search" link
        And The buyer should be to redirect to "/search/new"
        And The buyer should fill in Title and Category
        And A buyer click the "Search" link
        Then The buyer should be able to see the "announcements"
        