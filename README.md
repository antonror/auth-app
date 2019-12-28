# README
Basic authentication API with Event CRUD and Admin Users CRUD

Admin namespace is available via `/admin`. Allows to edit and delete users. 

* Ruby version ``` 2.5.5```

API for user authentication:

## Sign Up

POST request to: ` http://localhost/api/v1/signup `

Data format: `form-data`

Required fields:
```
user[email]
user[password]
```

Sample request:
`http://localhost:3000/api/v1/sign_up?user[email]=test@test.com&user[password]=123123123`

## Sign In

POST request to: ` http://localhost/api/v1/signin `

Data format: `form-data`

Required fields:
```
user[email]
user[password]
```

Sample request:
`http://localhost:3000/api/v1/sign_in?user[email]=test@test.com&user[password]=123123123`