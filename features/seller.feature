Feature: Seller features


   Scenario: Seller is not signed up
        Given no seller exists with an email of "email1@person.com"
        When A seller go to the "/sellers/sign_in" page
        And The seller sign in as "email1@person.com","password"
        Then The seller should be to redirect to "/sellers/sign_in"

    Scenario: Seller signs in successfully
        Given A seller is signed up and confirmed as "username","email1@person.com","password"
        When A seller go to the "/sellers/sign_in" page
        And The seller sign in as "email1@person.com","password"
        Then The seller should be to redirect to "/"

    Scenario: As a Seller I want to ACCESS MY ANNOUNCEMENT LIST so that I can DISPLAY ALL MY ANNOUNCEMENTS
        Given A registered seller as "username","email1@person.com","password"
        When A seller go to the "/" page
        And A seller click the "My Objects" link
        Then The seller should be to redirect to "/seller/my_objects"

    Scenario: As a Seller I want to ACCESS MY ORDER LIST so that I can DISPLAY ALL MY ORDERS
        Given A registered seller as "username","email1@person.com","password"
        When A seller go to the "/" page
        And A seller click the "Orders" link
        Then The seller should be to redirect to "/seller/my_orders"

     Scenario: As a Seller I want to HAVE A CREATE ANNOUNCEMENT FORM so that I can CREATE AN ANNOUNCEMENT
        Given A registered seller as "username","email1@person.com","password"
        When A seller go to the "/" page
        And A seller click the "Sell an object" link
        Then The seller should be to redirect to "/announcements/new"

     Scenario: As a Seller I want to HAVE PROFILE so that I can SHOW MY USERNAME, SHOW MY EMAIL
      Given A registered seller as "username","email@person.com","password"
      And A seller go to the "/seller/profile" page
      Then The seller should see his features
