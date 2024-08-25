# 🩸 Blood Bank Management System - SQL Project

## 🏥 Project Overview
The Blood Bank Management System aims to streamline the management of blood donations, recipients, and the availability of blood units across multiple locations. It focuses on optimizing data management, ensuring the timely availability of blood units, and enabling detailed analysis to support decision-making processes.

## 🎯 Objectives
- **Efficient Data Management**: Track donors, recipients, blood units, and blood bank locations.
- **Timely Availability**: Ensure blood units are available when needed, minimizing shortages.
- **Optimization**: Optimize the usage of blood units to prevent wastage due to expiration.
- **Data Analysis**: Perform detailed analysis on blood availability, service times, and donor/recipient patterns.

## 📁 Database Schema Design

### 1. **Donors Table**
This table stores information about the blood donors.

| Column Name         | Data Type | Description |
|---------------------|-----------|-------------|
| `donor_id`          | INT (PK)  | Unique identifier for each donor. |
| `name`              | VARCHAR   | Donor's full name. |
| `age`               | INT       | Donor's age. |
| `blood_type`        | VARCHAR   | Donor's blood type (e.g., A+, B-, O+). |
| `last_donation_date`| DATE      | The date of the last donation made by the donor. |

### 2. **Recipients Table**
This table contains information about blood recipients.

| Column Name         | Data Type | Description |
|---------------------|-----------|-------------|
| `recipient_id`      | INT (PK)  | Unique identifier for each recipient. |
| `donor_id`          | INT (FK)  | Foreign key linking to the `donors` table. |
| `name`              | VARCHAR   | Recipient's full name. |
| `age`               | INT       | Recipient's age. |
| `blood_type`        | VARCHAR   | Recipient's blood type (e.g., A+, B-, O+). |
| `requirement_date`  | DATE      | The date when the recipient requires the blood. |

### 3. **Blood Units Table**
This table manages the inventory of blood units.

| Column Name         | Data Type | Description |
|---------------------|-----------|-------------|
| `unit_id`           | INT (PK)  | Unique identifier for each blood unit. |
| `donor_id`          | INT (FK)  | Foreign key linking to the `donors` table. |
| `blood_type`        | VARCHAR   | The blood type of the unit. |
| `donation_date`     | DATE      | The date when the blood was donated. |
| `expiry_date`       | DATE      | The date when the blood unit expires. |
| `status`            | VARCHAR   | Status of the blood unit (e.g., Available, Reserved, Used, Expired). |

### 4. **Blood Banks Table**
This table stores information about blood bank locations, services, and contact details.

 Column Name               Description |
-----------------------------------------------------------------------------
| Column Name              | Data Type | Description |
|--------------------------|-----------|-------------|
| `bank_id`                | INT (PK)  | Unique identifier for each blood bank. |
| `blood_bank_name`        | VARCHAR   | Name of the blood bank. |
| `state`                  | VARCHAR   | The state where the blood bank is located. |
| `district`               | VARCHAR   | The district where the blood bank is located. |
| `city`                   | VARCHAR   | The city where the blood bank is located. |
| `address`                | TEXT      | The full address of the blood bank. |
| `pincode`                | VARCHAR   | The postal code of the blood bank's location. |
| `contact_no`             | VARCHAR   | Primary contact number for the blood bank. |
| `mobile`                 | VARCHAR   | Mobile number for urgent contact. |
| `helpline`               | VARCHAR   | Helpline number for public inquiries. |
| `fax`                    | VARCHAR   | Fax number (if available). |
| `email`                  | VARCHAR   | Email address for the blood bank. |
| `website`                | VARCHAR   | Website link for the blood bank. |
| `nodal_officer`          | VARCHAR   | Name of the nodal officer in charge. |
| `contact_nodal_officer`  | VARCHAR   | Contact number of the nodal officer. |
| `mobile_nodal_officer`   | VARCHAR   | Mobile number of the nodal officer. |
| `email_nodal_officer`    | VARCHAR   | Email of the nodal officer. |
| `qualification_nodal_officer` | VARCHAR | Qualifications of the nodal officer. |
| `category`               | VARCHAR   | Type of blood bank (e.g., Government, Charity). |
| `blood_component`        | VARCHAR   | Indicates whether blood components are available. |
| `apheresis`              | VARCHAR   | Indicates whether apheresis services are available. |
| `service_time`           | VARCHAR   | Operating hours of the blood bank (e.g., 24x7, Business Hours). |
| `license_no`             | VARCHAR   | License number of the blood bank. |
| `date_license_obtained`  | DATE      | Date when the license was obtained. |
| `date_of_renewal`        | DATE      | Last renewal date of the license. |
| `latitude`               | DECIMAL   | Latitude coordinates of the blood bank. |
| `longitude`              | DECIMAL   | Longitude coordinates of the blood bank. |




## 🛠️ System Features

### 1. **Donor Management**
- **Add New Donors**: Register new donors with their details.
- **Track Donations**: Record donation dates and manage donor eligibility.

### 2. **Recipient Management**
- **Match Donors**: Match recipients with suitable blood units based on blood type.
- **Record Transfusions**: Update the system when a blood unit is allocated to a recipient.

### 3. **Blood Unit Management**
- **Inventory Management**: Track the status and availability of blood units.
- **Expiry Alerts**: Notify about blood units nearing expiry.

### 4. **Blood Bank Management**
- **Location Tracking**: Manage and track the locations and services offered by blood banks.
- **Contact Management**: Ensure contact details of nodal officers and other key personnel are up-to-date.

