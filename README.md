# Trello API - Tech Assignment 2022

This is a full stack developer assignment 2022. 

The sprint goals are generally creating a web application that interacts with [Trello's API](https://developer.atlassian.com/cloud/trello/rest/api-group-actions/) to perform actions like;

- **Creating cards on Trello.** 
- **Fetching lists.**

## Solution Implementation

In order to solve the challenge I perform the following key tasks:
1. **Creating a Trello Account and Reading the API Documentation**
3. **Setting up the backend in Rails and Integrating Trello API**
4. **Developing the frontend in React**
5. **Performing tests on the API using Postman**
6. **Interacting with the API using Ruby on Rails**

## Stack
This project is build using the following technologies.

- **React Frontend** 
- **Ruby on Rails Backend**

## Running this Web Application
Upon downloading the file or cloning this project on github, install the required libraries in both **Ruby on Rails** and **React**

### Creating a Trello Account

In order to test this API you first need to have a Trello account. 

If you don't have a Trello account follow this [**link**](https://trello.com/login) to create one. If you have an account, create a board and in that board, create cards. 

Check out this [**youtube video**](https://youtu.be/geRKHFzTxNY) for guides on how to use Trello.

#### Generating Trello API Credentials

To generate API Credentials for your Trello Account, follow the guide provided in this [**article**](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/#:~:text=You%20can%20get%20your%20API,comprised%20of%20random%20alphanumeric%20characters.). You will need the following details from the Trello's API.

- **API Key**
- **Access Token**
- **Id of a Board**
- **Id of the Lists in a Board**

To learn how to get such data please read the [**Trello API Documentation**](https://developer.atlassian.com/cloud/trello/rest/)

### System Requirements

Make sure you have **Ruby and Rails** and **Node.js** installed in your computer. If you don't have them installed in your computer, follow the following guides:

1. [How to install Ruby on Rails](https://guides.rubyonrails.org/v5.1/getting_started.html)
2. [How to install Node.js](https://nodejs.org/en/download/)

### Accessing Files

To get the files to this project in your computer, perform a git clone in your terminal or download a zipped file of the project on github.

```bash

git clone https://github.com/LeonardMuia/trello-rails-api.git

```

### Installing Ruby on Rails Gems and Node.js Packages

To install gems required to run the Ruby on Rails app, run the following command in your terminal.

```bash

bundle install

```

Navigate to the frontend folder in your terminal and run the following command to install packages for the React app and build.

```bash

npm install && npm run build

```

### API Credentials Required

Create a ```.env ``` file in the root of your rails application and add the following code.

```ruby

API_KEY=YOURAPIKEYGOESHERE
TOKEN=YOURTOKENGOESHERE
ID_LIST=YOURIDLISTGOESHERE
ID_BOARD=YOURIDBOARDGOESHERE

```

### Start the rails server

Navigate to your root folder in the terminal and enter the following command to start the rails app.

```bash

rails s

```

### Start the React server

Navigate to the frontend folder in the terminal and run the following command to start the react app. 


```bash

npm run dev

```

#### Take note
Make sure it runs on port **5173** if not, find the ``Cors.rb`` and whitelist your localhost url for the React app by editing the origins. This will eliminate CORS error.


**Finally, navigate to the URL provided in by the rails server to view your application.**



## Contributing
You can make changes however you like upon making a pull request. Have fun testing the application and customizing it to your needs. Cheers!!