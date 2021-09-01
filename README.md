# Bottle on Pythonanywhere Tutorial
 How to create a basic database driven website with Bottle and MySQL

### Contents
* <a href="#download-ubuntu">Create pythonanywhere account</a>
* <a href="#install-oracle">Create MySQL Database</a>
* <a href="#install-oracle">Create MySQL Database</a>



***

1. Go to https://pythonanywhere.com and click on "Pricing and signup".

![pricing and signup](images/01%20pythonanywhere.png)

2. Click on the button "Create a Beginner account".

![create beginner account](images/02%20free_account.png)

3. Add your Username, Email, and create your password, the click "Register".

![create password](images/03%20create_account.png)

4. After you have created your account, confirm your email.

![confirm email](images/05%20confirm_email.png)

5. Instantiate a MySQL database by clicking on the "Databases" link.

![create db](images/06%20click_db.png)

6. By default, the MySQL tab is selected. You must now create a database password which is 
   different from your pythonanywhere password.

![initialize mysql](images/07%20initialize_mysql.png)

7. The system automatically creates a database called "default". The fully qualified database 
   name is <your_pythonanywhere_account_name>$default. In this case "bottlejmj$default". 
   Click on the db name to open a MySQL console

![open mysql console](images/08%20open_db_console.png)

8. Copy the script below. We will paste it into the MySQL console to create the "users" table.

`
CREATE TABLE users ( id int NOT NULL AUTO_INCREMENT COMMENT 'primary key', first_name varchar(25) 
NOT NULL, last_name varchar(25) NOT NULL, PRIMARY KEY (id) ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT 
CHARSET=utf8;
`

9. Copy the script below. We will paste it into the MySQL console to create the "users" table. 
   Then press "enter"

![paste script](images/11%20paste_script.png)

10. You should get a message that the query ran OK.

![table created](images/12%20table_created.png)

11. At the MySQL prompt type "show tables" which should show you that the "users" table was successfully 
    created.

![show tables](images/13%20table_show_tables.png)

12. Click on the python icon to return to the dashboard.

![return to dashboard](images/14%20go_to_dashboard.png)

13. Click on the "Web" tab.

![click on web tab](images/15%20go_to_web.png)

14. Add a new web app.

![add web ap](images/16%20add_web_app.png)

15. Click "Next" to create your domain name.

![create web ap domain](images/17%20web_app_domain.png)

16. Select the "Bottle" framework.

![select bottle](images/18%20bottle.png)

17. Select the latest Python version.

![select python](images/18%20python_39.png)

18. Accept the default path information for your Bottle project and click "Next".

![accept bottle path defaults](images/19%20quickstart_bottle.png)

19. Once the site has been created, scroll down to see the file locations of your site.

![scroll down](images/20%20scroll_down.png)

20. Let's click at the wsgi configuration file which holds important information about our project.

![scroll down](images/21%20wsgi_file.png)

21. 1. The first arrow points to the home location of our web application (/home/bottlemjm/mysite).
    2. The second arrow points to the location of the views or web templates that will display content
       (/home/bottlemjm/mysite/views)
    3. The third arrow points to "import application" which refers to the bottle_app information and 
       how it will be imported into the controller. Many web applications follow the MVC framework or
       model, view, controller. In this project:
       
       Model = MySQL DB (the data structures for the project)
       Viewer = create_user.tpl, show_users.tpl (web templates used to display data to users)
       Controller = /home/bottlemjm/mysite/bottle_app.py (The program code)
       

![wsgi_params](images/22%20wsgi_params.png)

22. Click on the menu bar, then click "Web"

![wsgi_params](images/23%20gotowebmenu.png)

23. Click on the "mysite" directory.

![go to mysite directory](images/24%20click_on_mysite.png)

24. Create a new directory by typing "views", then click "New directory".

![create directory](images/25%20create_directory.png)

25. Create a new file by typing "create_user.tpl" and click "New file".

![create user template](images/26%20create_user.png)

26. You now have an empty template called "create_user.tpl". 

![add code](images/26-1%20create_user.png)

27. Copy, paste and save the template with the code snippet below.
````
<h2>Create a new User:</h2>
%# Send a GET request with the first and last names to the create_user
%# function which resides in ./mysite/bottle_app.py

<form action="/create_user" method="GET">
  <input type="text" size="100" maxlength="100" name="first_name">
  <input type="text" size="100" maxlength="100" name="last_name">
  <input type="submit" name="save" value="save">
</form>
````

28. Click on the "views" folder.

![go to views folder](images/26-2%20goto_views_folder.png)

29. Create a new file by typing "show_users.tpl" and click "New file".

![create show_users](images/27%20show_user.png)

30. You now have an empty template called "show_users.tpl".

![add code](images/27-1%20create_show_user.png)

31. Copy, paste and save the template with the code snippet below.
````
<h2>Below are a list of users</h2>
<table border="1">
  <tr>
    <td><strong>ID</strong></td>
     <td><strong>First Name</strong></td>
     <td><strong>Last Name</strong></td>
  </tr>

%# The % signs mark the beginning and end of python code.
%# The rows object is a recordset.
%# The row ojbect is a row in the recordset
%# The {{ }} outputs data from the row to the screen
%# The row[0] means the first column in the row and so on

%for row in rows:
  <tr>
    <td>{{row[0]}}</td>
     <td>{{row[1]}}</td>
     <td>{{row[2]}}</td>
  </tr>
%end

</table>
<div style="padding-top: 15px">
<a href="/create_user"><h3>Add a New User<h3></a>
</div>
````

32. Click on the "mysite" folder.

![go to mysite folder](images/27-2%20goto_mysite.png)

33. Click on the "bottle_app.py" folder. This is the controller file which will contain 
    the functions necessary to retreive data from the database and pass it to the templates 
    for display.

![edit bottle app](images/28%20bottle_app.png)

33. This is the default code that is found in "bottle_app.py".

![go to mysite folder](images/29%20bottle_code.png)

34. Let's replace this default code with the code shown below.

````
from bottle import default_app, get, template, request
import mysql.connector



###########  configure mysql db connfiguration properties ###############

db_config = {
        "host":"<your pythonanywhere account name>.mysql.pythonanywhere-services.com",
        "user":"<your mysql username>",
        "password":"<your mysql password>",
        "database":"<your pythonanywere account name>$default"
        }

###########  setup DB connection and cursor  ############################

mysqlConnection = mysql.connector.connect(**db_config)
cursor = mysqlConnection.cursor()


###########  route definitions  #########################################

@get("/create_user", method='GET')
def create_user():

    if request.GET.save:

        var_first_name = request.query.first_name
        var_last_name = request.query.last_name

        insert_stmt = (
            "INSERT INTO users(first_name, last_name) VALUES (%s, %s)"
            )

        data = (var_first_name, var_last_name)

        cursor.execute(insert_stmt, data)
        new_id = cursor.lastrowid

        mysqlConnection.commit()


        return '<p>The new user created with ID %s</p>' % new_id
    else:
        return template('create_user.tpl')


@get("/")
def get_users():
    cursor.execute("SELECT * FROM users")
    rows = cursor.fetchall()
    output = template('show_users.tpl', rows=rows)
    return output


###########  setting default app  #########################################
# All application settings are found in the wsgi.py file
application = default_app()

````
33. We now need to finish editing the db_config parameters. Change the code
    **<your pythonanywhere account name\>** to your pythonanywhere account name. So if your
    Pythonanywhere account name is **jimPython**, the host parameter would look like the code snippet below.

````
###########  configure mysql db connfiguration properties ###############

db_config = {
        "host":"<jimPython>.mysql.pythonanywhere-services.com",
        ...

````

34. Now add the **MySQL** username and password you setup earlier, and finally add your 
    **pythonanywhere** account name to the database string

````
###########  configure mysql db connfiguration properties ###############

db_config = {
        "host":"<jimPython>.mysql.pythonanywhere-services.com",
        "user":"<mysqlUser>",
        "password":"<mysqlPasswd>",
        "database":"<jimPython>$default"
        }
````
35. Click "Save".

![save bottle_app.py](images/30%20click save.png)

36. Click on the menu bar then select "Web".

![click web](images/31%20click_on_web.png)

37. Click on the web application address".

![click web](images/32%20launch_app.png)