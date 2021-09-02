<h2>Create a new User:</h2>
%# Send a GET request with the first and last names to the create_user
%# function which resides in ./mysite/bottle_app.py

<div width="250px">
  <form action="/create_user" method="GET">
    First Name:
    <input type="text" size="100" maxlength="100" name="first_name">
    <br />
    Last Name:
    <input type="text" size="100" maxlength="100" name="last_name">
    <input type="submit" name="save" value="save">
  </form>
</div>