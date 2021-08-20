from bottle import default_app, get, template, request
import mysql.connector



###########  configure mysql db connfiguration properties ###############

db_config = {
        "host":"your pythonanywhere account name>.mysql.pythonanywhere-services.com",
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
