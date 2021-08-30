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

``
