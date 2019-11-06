**Overview**

Sweater Weather is a Ruby on Rails REST API that returns weather, image, and navigation data via 3 distinct endpoints. Sweater weather can return a forecast for any location, find images for that location, and calculate navigation time, mileage, and a forecast for a destination. This application was built in 4 days as a school project at Turing School of Software and design. 

**Developer Notes** 

The main goal of this project was to get practice with consuming and exposing API endpoints, while adhearing to OOP principles of Abstraction, Encapsulation, SRP and DRY. If you would like to collaborate on this project, please follow the design patterns already implemented in this source code. I would love to hear your feedback! 

**Development Link** 
* https://ts-sweater-weather.herokuapp.com/

**Local Setup**

If you want to demo this application locally, follow these steps: 
  1. Clone this repo
  1. Enter the root project directory from the command line 
  1. Run `bundle install` 
  1. run `rake db:{create,migrate}`
  1. Start your local server with `rails server` 
  1. Start sending requests to localhost:3000 via browser or application like postman

**Endpoints** 

1. Forecast: `GET /api/v1/forecast?location=<USER_ENTERED_LOCATION>` 
  * Returns a forecast for the argument location. 
  * Required: 
    * params: {
      'location' => <USER_ENTERED_LOCATION>
    }
  * Example Response: 
``` 
  "data": {
        "id": "0",
        "type": "forecast",
        "attributes": {
            "current": {
                "app_temp": 48.18,
                "dal_temp_low": 30.96,
                "dal_temp_high": 61.35,
                "day_summary": "Clear",
                "humidity": 0.48,
                "icon": "clear-night",
                "night_summary": "Clear",
                "summary": "Clear",
                "temp": 48.25,
                "time": "02:32AM",
                "timezone": "America/Denver",
                "uv": 0,
                "visibility": 10
            },
            "next_8_hrs": [
                {
                    "icon": "clear-night",
                    "temp": 49.58,
                    "time": "02:00AM"
                },
                {
                    "icon": "clear-night",
                    "temp": 47.13,
                    "time": "03:00AM"
                },
                ...
            ],
            "next_5_days": [
                {
                    "icon": "clear-day",
                    "day": "Wednesday",
                    "summary": "Clear throughout the day.",
                    "percip_prob": 0.06,
                    "temp_high": 61.35,
                    "temp_low": 30.96
                },
                {
                    "icon": "clear-day",
                    "day": "Thursday",
                    "summary": "Clear throughout the day.",
                    "percip_prob": 0.11,
                    "temp_high": 51.23,
                    "temp_low": 27.13
                },
                ...
            ]
        }
    }
}
```

2. Background `/api/v1/backgrounds?location=denver,co` 
  * Returns background images for argument location 
  * Required: 
    * params: {
      'location' => <USER_ENTERED_LOCATION>
    }
  * Example Response: 
```
  {
    "data": [
        {
            "id": "0",
            "type": "background",
            "attributes": {
                "image_url": "https://www.flickr.com/photos/markbyzewski/49021711496/",
                "title": "A-9695"
            }
        },
        {
            "id": "0",
            "type": "background",
            "attributes": {
                "image_url": "https://www.flickr.com/photos/135433950@N06/49021710761/",
                "title": "smart switchable glass, PDLC film, smart lcd film, privacy glass, intelligent glass, magic glass,"
            }
        },
       ...
    ]
}
``` 

3. Users `POST /api/v1/users` 
  * Sends a request for profile creation, returns an API Key.
  * Required: 
    * raw JSON body: {
        'email' => <YOUR_EMAIL> 
        'password' => <CHOSEN_PASSWORD> 
        'password_confiration' => <CHOSEN_PASSWORD> 
      }
  * Example Response: 
```
    {
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
```

4. Sessions `POST /api/v1/sessions` 
  * Sends a login request to the application, returns an API key.
  * Required: 
    * raw JSON body: {
        'email' => <YOUR_EMAIL> 
        'password' => <CHOSEN_PASSWORD> 
      }
  * Example Response: 
```
    {
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
```

5. Road Trip `POST /api/v1/road_trip`
  * Returns a road trip object containing travel time to destination, distance, and a weather summary for the time of arrival 
  * Required: 
    * raw JSON body: {
        'origin' => <ORIGIN LOCATION> 
        'destination' => <DESTINATION LOCATION> 
        'api_key' => <YOUR USER API KEY> 
      } 
  * Example Response: 
```
  {
    "data": {
        "id": "0",
        "type": "road_trip",
        "attributes": {
            "distance": "112 mi",
            "duration": "1 hour 48 mins",
            "weather_summary": {
                "temperature": 35.55,
                "summary": "Clear"
            }
        }
    }
}
```
  
