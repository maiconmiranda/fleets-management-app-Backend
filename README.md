# Fleets Management App

## About

---

This is the backend for the app.
The frontend can be found [here](https://github.com/maiconmiranda/fleets-management-app-Frontend).
The app manages company`s fleet expenses, by adding vehicles, drivers and everyday expenses that the drivers had.

BackEnd [link](https://fleets-management-backend.herokuapp.com/)

### Setup

---

- Fork the repo
- git clone to your computer's folder
- cd into the fleets folder
- Run

```
bundle install
```

- This app uses database Postgreql

```
rails db:create
```

To create the database

- We have a seeds file, to populate the db, run

```
rails db:seed
```

## Models

---

1. User

Manage the users, all the users are setup as drivers, however they have a boolean row to set as admin to true or false. If the user is adimn then the user is the company's manager of the app.
The authentication is handled by Json Token.

2. Company

Relates to the company's details, the company id is added as foreign key to the users table, as the users belongs to the company.

3. Vehicle

Relates to the vehicles that belongs to the company, also holds the company id as foreign key.

4. Daily Track

As the app tracks the expenses from each driver by daily bases, this table stores the vehicle's odometer as well expenses with fuel, parking, fines and others.

5. Daily Report

Relates to any conditions about vehicle or other conditions reported by the drivers.

6. Incident

If any driver is involved in any incidents the information will be stored in this model.

## Controllers

1. Companies

Has all the methods to send and receive, create and update data.

2. Vehicles

Has all the resources endpoints as well a controller to send all the vehicles that belongs to a company.
The `show_vehicle_from_company` method grabs all the vehicle that belongs to current user and company.

3. Daily Tracks

Aside from the standard methods. this controller has the following

`daily_tracks_company_all`

- this method sends all the daily tracks that belongs to a company and that is from other users, in this case the drivers.

4. Daily Reports

This controller also has a custom method.

`daily_reports_company_all`

- Sends all the daily reports from diferent users that belongs to a company. It grabs all the `daily_reports` that has the same company id.

`show_daily_report_sorted_vehicle`

- As a vehicle has many reports, through this controller, by passing the vehicle id, it sends all the daily reports that belongs to the vehicle.

5. Incidents

`incidents_company_all`
Sends all the incidents that belongs to a company

`show_incident_sorted_vehicle`

- this controller sends all the incidents related to a vehicle, by passing the vehicle id.
