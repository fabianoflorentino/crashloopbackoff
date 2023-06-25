# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```mermaid
%%{ init: {
  'flowchart': { 'curve': 'linear' } } }%%
graph TD

  subgraph Site
    direction LR
    main_page(Main Page)
    questions(Questions)
    answers(Answered)
  end

  subgraph "Admin_Authenticate"[Admin Authenticate]
    admin_login(Login)
  end

  subgraph "Admin_Backoffice"[Admin Backoffice]
    admin_backoffice(Admin Backoffice)
    admin_welcome_index(Welcome Page)
  end

  subgraph "User_Authenticate"[User Authenticate]
    user_login(Login)
  end

  subgraph "User_Backoffice"[User Backoffice]
    user_backoffice(Admin Backoffice)
    user_welcome_index(Welcome Page)
  end

  main_page --> questions & answers


  Site --> Admin_Authenticate
  Admin_Authenticate --> Admin_Backoffice
  admin_backoffice --> admin_welcome_index
  Site --> User_Authenticate
  User_Authenticate --> User_Backoffice
  user_backoffice --> user_welcome_index

  classDef site fill: #7FB3D5, stroke: #000000, color: #000000
  classDef admin fill: #82E0AA, stroke: #000000, color: #000000
  classDef user fill: #F8C471, stroke: #000000, color: #000000
  class Site site
  class Admin_Authenticate admin
  class Admin_Backoffice admin
  class User_Authenticate user
  class User_Backoffice user
```
