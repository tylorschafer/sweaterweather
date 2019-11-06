**Overview**

Sweater Weather is a Ruby on Rails REST API that returns weather, image, and navigation data via 3 distinct endpoints. Sweater weather can return a forecast for any location, find images for that location, and calculate navigation time, mileage, and a forecast for a destination. This application was built in 4 days as a school project at Turing School of Software and design. 

**Developer Notes** 

The main goal of this project was to get practice with consuming and exposing API enpoints, while adhearing to OOP principles of Abstraction, Encapsulation, SRP and DRY. If you would like to collaborate on this project, please follow the design patterns already implemented in this source code. I would love to hear your feedback

**Setup**

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

