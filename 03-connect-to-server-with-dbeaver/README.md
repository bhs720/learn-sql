**[< Go back to main page](../../../)**


# Connect to server with DBeaver Community Edition

DBeaver is a free and open source database development environment, which allows you to connect to the database, execute queries, create tables, and more.

Download: https://dbeaver.io/download/

After installing DBeaver, click **Database** -> **New Database Connection**.

![01-new-db-connection](images/01-new-db-connection.png)


Select **PostgreSQL** as the database type and click **Next**.

![02-select-postgres](images/02-select-postgres.png)

Enter your Linux username and password. Type in **wheel** for **Session role**.

![03-username-password-role](images/03-username-password-role.png)

Switch to the **PostgreSQL** tab and check **Show all databases**.

![04-show-all-databases](images/04-show-all-databases.png)

Switch to the **SSH** tab and check **Use SSH Tunnel**. Click the pencil editing button to create a new SSH profile.

![05-ssh](images/05-ssh.png)

Click **Create** and give your new profile a name.

![06-new-profile](images/06-new-profile.png)

Check **Use SSH Tunnel**. Enter the server IP address and port. Enter your Linux username. Select **Public Key** for **Authentication Method**. Select the path to your private key file. Click **Test tunnel configuration** to test your SSH settings. If connection was successful, click **Apply and Close**.

![07-new-profile-test](images/07-new-profile-test.png)

Select your newly created profile from the dropdown menu. Click **Test Connection** to test your SSH settings as well as your database connection settings. If connection was successful, click **Finish**.

![08-new-connection-test](images/08-new-connection-test.png)

If everything was setup correctly, you should see the following databases listed under **Database Navigator** (sensitive info was removed from the image below).

![09-list-databases](images/09-list-databases.png)

**[< Go back to main page](../../../)**