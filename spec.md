# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (3 models: User, Item, Category)
- [x] Include at least one has_many relationship on your User model (User has_many Items and has_many Categories through Items)
- [x] Include at least one belongs_to relationship on another model (Item belongs_to User, Item belongs_to Category)
- [x] Include user accounts with unique login attribute (username must be unique to create an account)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Create: /items/new; Read: /items, /items/:id; Update: /items/:id/edit; Destroy: /items/:id)
- [x] Ensure that users can't modify content created by other users (User must be logged in and resource must belong to user to modify content)
- [x] Include user input validations (User cannot be created without both username and password or with empty strings. Item and Category cannot be created or edited to be empty string.)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message