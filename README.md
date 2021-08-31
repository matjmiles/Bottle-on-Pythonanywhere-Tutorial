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

`CREATE TABLE ``users`` (
``id`` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
``first_name`` varchar(25) NOT NULL,
``last_name`` varchar(25) NOT NULL,
PRIMARY KEY (``id``)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;`

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

26. Create a new file by typing "show_users.tpl" and click "New file".

![create user template](images/27%20show_user.png)




