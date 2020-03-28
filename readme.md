## OMBC Calendar

### Setup and Running the Project Locally

#### Dependancies
- Ruby 2.5.1, easily manage Ruby versions with [RVM](https://rvm.io/)
- [Bundler](https://bundler.io/) for gem management

#### Setup
- Clone the repo and `cd` into the project's root
- Run `bundle` to fetch necessary gems
- Once the project is setup, start the server: `ruby app.rb`
- Navigate to localhost:4567/events

### ToDo
- Set up job to hit events controller action daily
- Make post request with event info to Google Calendar
  - determine if an event already exists on the calendar, if so skip it
  - handle cancelled/removed events
- Figure out hosting (can we do this on GitHub Pages? If not look into something free like Heroku or DigitalOcean)

### Obtaining a Long-Lived User Access Token (life span of ~60 days)
Find the app ID and secret [here](https://developers.facebook.com/apps/1647788622031904/settings/basic/)

Find your user access token [here](https://developers.facebook.com/tools/accesstoken/)


```
curl -i -X GET "https://graph.facebook.com/{graph-api-version}/oauth/access_token?
    grant_type=fb_exchange_token&
    client_id={app-id}&
    client_secret={app-secret}&
    fb_exchange_token={your-access-token}"
```
