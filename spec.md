# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
-     Drill, Category, User, DrillCategory
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
-     A User has_many drills & has_many categories through drills. A Drill belongs_to a user, has_many drill_categories &
      has_many categories through drill_categories. A Category has_many drill_categories, has_many drills through
      drill_categories, & has_many users through drills. A DrillCategory belongs_to a drill & belongs_to a category. 
- [x] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
