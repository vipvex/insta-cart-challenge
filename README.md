Running the app

    bundle install
    rake db:create
    rake db:migrate
    rails s

Use ./applicant_analytics.rb --start 2014-07-01 --end 2014-09-01 to run analytics for the second part of the challenge.


The app uses the session to store and persist the applicant info throughout the app since it was part of the requirment to not persist the records. Although persistance could be easily added.
The models are tested, but the front end is not.

The git repo for this can be found at https://github.com/vipvex/insta-cart-challenge