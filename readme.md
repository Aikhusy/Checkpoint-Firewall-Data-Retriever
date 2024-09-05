
# Python-Based Firewall Data Retriever

## Overview

This application is designed to retrieve and store firewall data by connecting to firewalls via SSH, executing specific commands, and saving the results in a SQL Server database. The application is configurable and allows users to get firewall information.

## Reminder

Make sure the Check Point firewall is configured correctly, has Expert Mode enabled, and is connected to your PC.

## Hardware

Works with Check Point SMB and non-SMB Firewalls.

## How to Use

### 1. Download the Zip

Download the project zip file to your local machine.

[Newest Version](https://github.com/Aikhusy/Checkpoint-Firewall-Data-Retriever/blob/main/v%20alpha0.1/v%20alpha0.1.rar)

### 2. Extract the Zip

Extract the contents of the zip file to your desired directory.

### 3. Run Database Migrations

Execute the database migration scripts on your SQL Server to set up the necessary tables. Use the `db_migrations` file provided in the package.

### 4. Edit `config.json`

The `config.json` file contains the application's configuration settings, such as database connection details and SSH delay timings. Edit this file to match your environment.

#### Example `config.json`

```json
{
    "Driver": "ODBC Driver 17 for SQL Server",
    "Server": "MACBOOK-AIKHUSY",
    "Database": "cp_fw",
    "Trusted_Connection": "no",
    "UID": "sa",
    "PWD": "abcde1234",
    "Encrypt": "no",
    "TrustServerCertificate": "no",
    
    "Invoke_Shell_Delay": 0.5,
    "Run_Command_Delay": 0.7,
    "Expert_Shell_Delay": 1,

    "alert_status": false
}
```

- **Driver**: Specify the ODBC driver for SQL Server.
- **Server**: Your SQL Server's name or IP address.
- **Database**: Name of the database where the data will be stored.
- **UID**: Database username.
- **PWD**: Database password.
- **Invoke_Shell_Delay**: Delay before invoking the shell (in seconds).
- **Run_Command_Delay**: Delay before running each command (in seconds).
- **Expert_Shell_Delay**: Delay before entering expert mode (in seconds).
- **alert_status**: Boolean value to enable or disable alert status.

### 5. Add Your Firewall List in `fw_list.json`

Define the firewalls you want to retrieve data from in the `fw_list.json` file.

#### Example `fw_list.json`

```json
{
    "firewall": [
        {
            "fw_name": "Example 1",
            "fw_location": "Osaka",
            "fw_site": "Hidden",
            "ip": "192.168.40.243",
            "username": "read_only",
            "password": "read_only",
            "expert_password": "nguawur"
        },
        {
            "fw_name": "Example 2",
            "fw_location": "Jakarta",
            "fw_site": "Head Office",
            "ip": "172.24.39.245",
            "username": "admin7",
            "password": "admin1",
            "expert_password": "admin1"
        }
    ]
}
```

- **fw_name**: A friendly name for the firewall.
- **fw_location**: The location of the firewall.
- **fw_site**: Site information or description.
- **ip**: IP address of the firewall.
- **username**: Username for SSH login.
- **password**: Password for SSH login.
- **expert_password**: Password for entering expert mode on the firewall.

### 6. Run `main_detailed_save.exe` for Testing

Run the `main_detailed_save.exe` file to test the application. Check the Control Panel to ensure the program is running successfully. Additionally, verify that the data is being stored correctly in the database by executing the following SQL command:

```sql
SELECT * FROM tbl_current_status;
```

### 7. Run `main_current_status.exe` for Testing

Run the `main_current_status.exe` file to test the application. Check the Control Panel to ensure the program is running successfully. Verify the data in the database by running the same SQL command:

```sql
SELECT * FROM tbl_current_status;
```

### 8. Schedule the Programs Using Windows Task Scheduler

Add the two programs to Windows Task Scheduler:

- **main_detailed_save.exe**: Schedule to run once a day.
- **main_current_status.exe**: Schedule to run every 5 minutes.

---

This documentation should help you set up and configure the Python-Based Firewall Data Retriever. For any further assistance, please refer to the included source code comments or reach out to your administrator.


**"Code by Aikhusy, made with Python."**
