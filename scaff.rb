# scaffold for Group with name and icon and references user 
rails g scaffold Group name:string icon:string user:references
# scaffold for Entity with name and amount and references user and group
rails g scaffold Entity name:string amount:integer user:references group:references