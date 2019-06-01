# README

This README would normally document whatever steps are necessary to get the
application up and running.

# README

This README would normally document whatever steps are necessary to get the
application up and running.
# Wireframe
Idea + sketches + setting up an app logic , extended goals ,and minimum requirements.

# SETUP
First, on my Desktop I created folder that contain my project. Inside project folder I created 2 independant repos for front(REACT) and back-end(RAILS) app by running terminal commandes inside each folder:
 1. created back-end  
rails new alero_app_api --api -d postgresql
 2. front-end folders
npx create-react-app art-client 


 # create database ONE TO MANY model.
* Database creation 
run in terminal: 
1.

     rails db:create
2.
I run the scaffold for model "users" and "arts" :

    rails g scaffold arts title img description:text size styles mediums materials

    rails g scaffold user first_name last_name email

"Users" can have many "arts". So I need a foreignkey column  inside  my arts table.

     rails g migration AddForeignKeyToArts 
3. 
inside migration-file with class ForeignKey... add : 

     add_column :arts, :user_id, :integer

* Database initialization

          rails db:migrate
* Record relation b/n models :
add a line in your file => models/arts.rb:

        belongs_to :user
add a line in your file => models/users.rb:

        has_many :arts

* Seed data
I use gem 'faker' for my User model. => need initialization
and regular seed data for Art model. 
1. 
in my Gemfile add a line :

    gem 'faker;
2. 
to initialize faker => run in terminal :

    bundle
3. 
after filling up all needed data in aseeds.rb file run in terminal:

    rails db:seed

 4. 
 check for data in abrowser => run :

     rails s 

5. 
on localhost:3000/users => you will see your seeded data.

* Routes setup.

Make changes in controllers so that your Art belong to user in a browser on the rigth route.
1. 
In my routes.rb I set up my routes for tables :

    Rails.application.routes.draw do
     resources :users, only: [:index, :show, :create] do
     resources :arts
     end
     end
2. 
run in terminal to see the routes identity :

    rails routes
3. 


* POSTMAN : create , delete , update routes working.
1.
in terminal run : 
rails routes 
this will show URL for different routes , so that in Postman I will use that URL for my PUT, DESTROY, POST ...
2. 
open a postman application 
since I set up my full CRUD for reviews (excluding only update=PUT)
* for model USERS:
I GET my users with the Art belong_to User on : 

     localhost:3000/users

I GET a specific user and art on id : 
     
     localhost:3000/users/1

I can create a new user on : 

    localhost:3000/users/
Delete User:

    localhost:3000/users/6

* for second model ARTS with full CRUD :
GET specific art item on id /=> show page : 

    localhost:3000/arts/1


I was able to create a new art on a route(POST), in that case this art will belong to user with id => 3:

      localhost:3000/users/3/arts/


delete specific art(id) (DELETE), wehere 9 = user.id & 6 = art.id:

      localhost:3000/users/9/arts/6
     
(PUT) or update for art runs on , where 4 => art.id : 

    localhost:3000/users/3/arts/4

* Preparation for front end => CORS
1. 
 in cors.rb file (config/initializers/cors.rb) ucomment: 
 
    "Rails.application.config.middleware...."
 2. 
 in Gemfile uncomment :
 
    gem 'cors'
 3. 
 run in terminal to initialize corse gem :

    bundle 

* Deployment instructions
#GitHub :

 1. created  a repo on github for back-end app.
 repositories => new
 *** 
 copied the url with my github created repo (https://github.com/kasyaro/Art.git) and insert it to : 
      git remote add origin /=> HERE <=/

***
 3. connected my lockal repo with git hub repo by running terminal commands inside my backend folder: 

 git add .
 git commit-m 'setup '
 git remote add origin https://github.com/kasyaro/Art.git
 git push -u origin master
* ...
