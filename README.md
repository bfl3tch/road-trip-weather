# Road Trip Weather

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
![Version][version-badge]



## Table of Contents

- [Contributors](#contributors)
- [Overview](#overview)
- [Tools Utilized](#framework)
- [Project Configurations](#setup)
- [Exposed Endpoints](#endpoints)

### <ins>Contributors</ins>

👤  **Brian Fletcher**
- Github: [Brian Fletcher](https://github.com/bfl3tch)
- LinkedIn: [Brian Fletcher](https://www.linkedin.com/in/bfl3tch/)


------

### <ins>Overview</ins>

[Road Trip Weather](https://backend.turing.edu/module3/projects/sweater_weather/) is a 5 day, 1 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

The challenge was to build a fully functional [JSON API 1.0 spec](https://jsonapi.org/)-compliant REST API that aggregates data from multiple third party API endpoints that require authentication, and renders responses back to authenticated users making requests from a separate front end web application framework.

Learning goals and areas of focus consisted of:

- Exposing an API that aggregates data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality
- Determining completion criteria based on the needs of other developers
- Researching, selecting, and consuming an API based on your individual needs as a developer

[Technical Requirements](https://backend.turing.edu/module3/projects/sweater_weather/requirements)

#### <ins>Framework</ins>
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-33b818.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-f74114.svg?&style=flat&logo=postman&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  </br>
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>


## <ins>Setup</ins>

Find the project spec [here](https://backend.turing.edu/module3/projects/sweater_weather/)

This project requires Ruby 2.7.2 and Rails 5.2.6.

* Fork this repository
* Install gems and set up your database:
    * `bundle`
    * `rails db:{drop,create,migrate,seed}`
* Run the test suite with `bundle exec rspec -fd`
* Run your development server with `rails s`


### Project Configurations

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/tvaroglu/sweater_weather/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'sweater_weather_development'
    Created database 'sweater_weather_test'
    ```

* How to Run the Test Suite
    ```bash
    $ bundle exec rspec -fd
    ```

* Third Party API Access
  - This repository requires access to the following services:
    1. [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
    2. [MapQuest Geocoding & Route APIs](https://developer.mapquest.com/documentation/)
        - [Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/address/get/)
        - [Route API](https://developer.mapquest.com/documentation/directions-api/route/get/)
    3. [Unsplash JSON API](https://unsplash.com/documentation)


* [API Key Configuration](https://github.com/laserlemon/figaro)
    ```bash
    $ bundle exec figaro install
    ```
    - Add your API keys to `config/application.yml`:
      ```yml
      mapquest_api_key: <your MapQuest API key>
      weather_api_key: <your OpenWeather API key>
      photo_api_key: 'Client-ID <your Unsplash API key>'
      ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop
    ```


## Endpoints


The `base path` of each endpoint is:

```
http://localhost:3000/api/v1
```

- For `GET` requests, you can send the endpoint requests through your internet browser, or utilize an API client (i.e. [Postman](https://www.postman.com/))
- For `POST` requests, you will need to use an API client to provide the required request body
- A fully functional [Postman collection](https://github.com/bfl3tch/road-trip-weather/blob/main/spec/postman_collections/SweaterWeatherDemo.postman_collection.json) is included with this repository, to further assist with UAT and endpoint exploration


The following table presents each API endpoint and its associated documentation
- For `GET` requests, an example link is provided for demonstration purposes  

# Search Endpoints

## Get Forecast

Get weather information about a given city.

```
GET /forecast
```

### Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`location`  | String      | Query Parameters  | Required          | The city to search for.

### Example Request

```
GET http://localhost:3000/api/v1/forecast?location=denver,co
```

### Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2021-09-28T16:49:56.000-06:00",
        "sunrise": "2021-09-28T06:53:27.000-06:00",
        "sunset": "2021-09-28T18:47:23.000-06:00",
        "temperature": 74.57,
        "feels_like": 73.24,
        "humidity": 32,
        "uvi": 1.0,
        "visibility": 10000,
        "conditions": "scattered clouds",
        "icon": "03d"
      },
      "daily_weather": [
        {
          "date": "2021-09-28T12:00:00.000-06:00",
          "sunrise": "2021-09-28T06:53:27.000-06:00",
          "sunset": "2021-09-28T18:47:23.000-06:00",
          "max_temp": 79.25,
          "min_temp": 66.81,
          "conditions": "light rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-29T12:00:00.000-06:00",
          "sunrise": "2021-09-29T06:54:24.000-06:00",
          "sunset": "2021-09-29T18:45:45.000-06:00",
          "max_temp": 71.64,
          "min_temp": 51.89,
          "conditions": "heavy intensity rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-30T12:00:00.000-06:00",
          "sunrise": "2021-09-30T06:55:21.000-06:00",
          "sunset": "2021-09-30T18:44:07.000-06:00",
          "max_temp": 60.91,
          "min_temp": 50.45,
          "conditions": "moderate rain",
          "icon": "10d"
        },
        {
          "date": "2021-10-01T12:00:00.000-06:00",
          "sunrise": "2021-10-01T06:56:19.000-06:00",
          "sunset": "2021-10-01T18:42:29.000-06:00",
          "max_temp": 69.57,
          "min_temp": 53.56,
          "conditions": "few clouds",
          "icon": "02d"
        },
        {
          "date": "2021-10-02T12:00:00.000-06:00",
          "sunrise": "2021-10-02T06:57:16.000-06:00",
          "sunset": "2021-10-02T18:40:52.000-06:00",
          "max_temp": 72.86,
          "min_temp": 57.49,
          "conditions": "clear sky",
          "icon": "01d"
        }
      ],
      "hourly_weather": [
        {
          "time": "2021-09-28T16:00:00.000-06:00",
          "temperature": 75.6,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T17:00:00.000-06:00",
          "temperature": 74.57,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T18:00:00.000-06:00",
          "temperature": 75.09,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T19:00:00.000-06:00",
          "temperature": 72.9,
          "conditions": "light rain",
          "icon": "10n"
        },
        {
          "time": "2021-09-28T20:00:00.000-06:00",
          "temperature": 71.19,
          "conditions": "light rain",
          "icon": "10n"
        },
        {
          "time": "2021-09-28T21:00:00.000-06:00",
          "temperature": 70.14,
          "conditions": "broken clouds",
          "icon": "04n"
        },
        {
          "time": "2021-09-28T22:00:00.000-06:00",
          "temperature": 67.82,
          "conditions": "overcast clouds",
          "icon": "04n"
        },
        {
          "time": "2021-09-28T23:00:00.000-06:00",
          "temperature": 66.81,
          "conditions": "overcast clouds",
          "icon": "04n"
        }
      ]
    }
  }
}
```

### Example Request - Empty Location Parameter

```
GET http://localhost:3000/api/v1/forecast?location=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Missing Location Parameter

```
GET http://localhost:3000/api/v1/forecast
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

---

## Get Background

Get an image background for a given city.

```
GET /backgrounds
```

### Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`location`  | String      | Query Parameters  | Required          | The city to search for.

### Example Request

```
GET http://localhost:3000/api/v1/backgrounds?location=denver,co
```

### Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": null,
    "type": "image",
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNjM2OTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzI3ODMyODc&ixlib=rb-1.2.1"
      },
      "credit": {
        "provider": "Unsplash",
        "photographer": "Ryan De Hamer",
        "photographer_profile_url": "https://unsplash.com/@rdehamer"
      }
    }
  }
}
```

### Example Request - Empty Location Parameter

```
GET http://localhost:3000/api/v1/backgrounds?location=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Missing Location Parameter

```
GET http://localhost:3000/api/v1/backgrounds
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

---
# Users Endpoints

HTTP Verb | Endpoint                   | Description                | Link
----------|----------------------------|----------------------------|---------------------------
POST      | `/users`                   | Create a new user.         | [Link](#create-user)
POST      | `/sessions`                   | Authenticate an existing user.         | [Link](#create-session)


---

## Create User

Create a new user with the provided attributes.

```
POST /users
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`email`                  | String    | Required          | The user's email.
`password`              | String    | Required          | The user's password.
`password_confirmation`       | String    | Required          | The user's password confirmation.


### Example Request

```
POST http://localhost:3000/ap1/v1/users
```

With the following request body:

```
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": "4",
    "type": "user",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "82caf75f-b1cc-4fb6-b3b3-ceb3de6ca61e"
    }
  }
}
```

### User Already Exists

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "Email has already been taken"
  ]
}
```

### Password Confirmation Mismatch

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "Password confirmation doesn't match Password"
  ]
}
```

### Password Confirmation Missing

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "'password_confirmation' is required to create a user account"
  ]
}
```

---

## Create Session

Authenticate an existing user.

```
POST /sessions
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`email`                  | String    | Required          | The user's email.
`password`              | String    | Required          | The user's password.


### Example Request

```
POST http://localhost:3000/ap1/v1/sessions
```

With the following request body:

```
{
  "email": "whatever@example.com",
  "password": "password"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": "4",
    "type": "user",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "82caf75f-b1cc-4fb6-b3b3-ceb3de6ca61e"
    }
  }
}
```

### Invalid Password, Missing Password, or User Email Not Found

```
Status: 401 Unauthorized
```

```
{
  "error":  "Unable to log in. Please try again."
}
```

# Road Trip Endpoint

HTTP Verb | Endpoint                   | Description                | Link
----------|----------------------------|----------------------------|---------------------------
POST      | `/road_trip`                   | Create a new road trip.         | [Link](#create-road-trip)

---

## Create Road Trip

Create a new road trip with the provided attributes.

```
POST /road_trip
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`origin`                  | String    | Required          | The starting city for the road trip.
`destination`              | String    | Required          | The ending city for the road trip.
`api_key`       | String    | Required          | The user's API key.


### Example Request - Valid Route

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Marco Island, FL",
  "destination": "Kennebunk, ME"
  "api_key": "82caf75f-b1cc-4fb6-b3b3-ceb3de6ca61e"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Marco Island, FL",
      "end_city": "Kennebunk, ME",
      "travel_time": "25 hours, 10 minutes",
      "weather_at_eta": {
        "temperature": 75.06,
        "conditions": "broken clouds"
      }
    }
  }
}
```

### Example Request - Invalid Route

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Kennebunk, ME",
  "destination": "Taiwan",
  "api_key": "82caf75f-b1cc-4fb6-b3b3-ceb3de6ca61e"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "London,UK",
      "travel_time": "impossible route",
      "weather_at_eta": {}
    }
  }
}
```

### Example Request - Bad or Missing API Key

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Marco Island, FL",
  "destination": "Kennebunk, ME"
}
```

### Example Response

```
Status: 401 Unauthorized
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "invalid API key"
  ]
}
```

### Example Request - Missing Origin or Destination

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Marco Island, FL",
  "api_key": "82caf75f-b1cc-4fb6-b3b3-ceb3de6ca61e"
}
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "error": "Must have both origin and destination query params"
}
```
<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/bfl3tch/road-trip-weather.svg?style=flat
[contributors-url]: https://github.com/bfl3tch/road-trip-weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/bfl3tch/road-trip-weather.svg?style=flat
[forks-url]: https://github.com/bfl3tch/road-trip-weather/network/members
[stars-shield]: https://img.shields.io/github/stars/bfl3tch/road-trip-weather.svg?style=flat
[stars-url]: https://github.com/bfl3tch/road-trip-weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/bfl3tch/road-trip-weather.svg?style=flat
[issues-url]: https://github.com/bfl3tch/road-trip-weather/issues
[version-badge]: https://img.shields.io/badge/API_version-V1-or.svg?&style=flat&logoColor=white
