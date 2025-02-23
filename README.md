# dotnetwebapi

Getting Started

1) Set Up the Database
- Open MySQL and create a new database. You can name it whatever you prefer.

2) Execute SQL Scripts
- Navigate to dotnetwebapi/db/ and copy the SQL scripts.
- Execute these scripts on your newly created database. This will restore the necessary data tables and stored procedures (PROCs) required for the API to function.

3) Configure the API
- Open the project and locate appsettings.json (or appsettings.Development.json if running locally).
- Under ConnectionStrings, find the Live property and update it with your database connection string.
- Run the API.

5) Access Swagger UI
- Once the API is running, the Swagger frontend will open automatically, allowing you to interact with the API endpoints.

6) Authenticate and Authorize
- Use the Login endpoint to retrieve a token. This token is required to authorize API requests.
- In the Swagger interface, click the Authorization button at the top.
- Enter the token received from the login endpoint to authorize your session.

That’s it! You’re all set to start making API requests

Some Params for you to use :)

POST //account/login
{
  "Email": "test@webapi.co.za",
  "Password": "Vhusa@9611"
}

GET /order/get/details/{OrderNumber}
{
    OrderNumber: 16437934625162832
}

GET /order/get/notes/{OrderId}
{
    OrderId: ord000017we1245
}

GET /user/get/byUserId/{UserId}
{
    UserId: usr00001mbm6zew
}

