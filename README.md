# Online Canteen Order Management System

## Overview

The Online Canteen Order Management System (OCOMAS) project is an innovative solution designed to provide a seamless experience for ordering pizzas online. Developed as a web-based platform, it allows customers to browse menus, place orders, and make payments effortlessly from their computers or mobile devices. This project streamlines the entire pizza ordering process, from browsing the menu to the final order placement. It reduces wait times, eliminates long queues, and ensures timely delivery. This platform is built for both users and administrators, offering easy access to order management, tracking, and real-time updates.

## Features

1. **User Panel**: Customers can create accounts, browse the pizza menu, select items, and place their orders. The user interface is designed to be intuitive and easy to navigate, ensuring a smooth experience for all customers.
2. **Admin Panel**: The admin panel provides administrative users with the ability to manage orders, update menus, track delivery status, and handle customer data. With admin credentials, administrators can oversee all operations of the website and ensure everything runs smoothly.
3. **Ratings and Reviews**: Customers can rate their orders, helping improve services and build customer trust.
4. **User Authentication**: Secure login and signup functionality ensures that users can safely access their profiles and order history.
5. **Responsive Design**: The platform is responsive and works across all devices, including desktops, tablets, and smartphones.

## Prerequisites

To set up this project locally, you will need the following:

- A **web server** like XAMPP, WAMP, or LAMP installed on your machine.
- **PHP** installed and configured (the project uses PHP for dynamic content).
- **MySQL** database support.
- **PHPMyAdmin** for database management.

## Project Setup

Follow these steps to set up the **Online Canteen** project on your local machine:

### Step 1: Download the Project

1. Download the project zip file from the link provided.
2. Extract the zip file to a folder on your local machine.

### Step 2: Move Files to the Server's Root Directory

- **For XAMPP**, move the `OnlinePizzaDelivery` folder to the `xampp/htdocs` directory.
- **For WAMP**, move the folder to `wamp/www`.
- **For LAMP**, move the folder to `var/www/html`.

### Step 3: Set Up the Database

1. Open **PHPMyAdmin** by navigating to `http://localhost/phpmyadmin` in your browser.
2. Create a new database with the name `ocomas`.
3. Import the `ocomas.sql` file found inside the `SQL` folder in the extracted project. This will create the necessary tables and initial data.

### Step 4: Access the Application

- **User Panel**: Open your browser and navigate to `http://localhost/OnlineCanteen/` to access the user panel.
- **Admin Panel**: Access the admin panel by navigating to `http://localhost/OnlineCanteen/admin/`. 

#### Admin Login Credentials:
- Username: `admin`
- Password: `admin`

### Step 5: Test the Application

Once you've set up the project and database, test the functionality by logging into both the user and admin panels. Try browsing the menu, placing orders, and managing them through the admin interface. Ensure that the database is properly storing the orders and customer data.

## Technologies Used

- **HTML/CSS**: For structuring and styling the web pages.
- **PHP**: For dynamic content generation and database interaction.
- **MySQL**: For storing and managing data such as orders, users, and menu items.
- **Bootstrap**: A front-end framework for creating responsive and visually appealing layouts.
- **JavaScript**: For handling client-side interactions.
- **FontAwesome**: For displaying icons throughout the site.

## Contributing

If you would like to contribute to the project, feel free to fork the repository, make improvements, and submit a pull request. You can help improve the codebase by fixing bugs, adding features, or enhancing the design.

## Future Enhancements

- **Mobile App**: Developing a mobile application for both Android and iOS to improve user accessibility.
- **Payment Gateway Integration**: Implementing a payment gateway to allow users to make online payments for their orders.
- **Order Tracking**: Implementing real-time order tracking for users to see the status of their pizza.
- **Multi-language Support**: Adding multiple language options for users across different regions.

## Contact

For more information about the project or for any inquiries, feel free to contact the team members:

- **Aaditya Sakhardande**: [LinkedIn](https://in.linkedin.com/in/aaditya-sakhardande-980668206)
- **Hrideya Goyal**: [LinkedIn](https://in.linkedin.com/in/hrideya-goyal-8a568a231)
- **Shubham Nagar**: [LinkedIn](https://in.linkedin.com/in/shubham-nagar-65b4a6206)

Credit: This project acknowledges and builds upon the contributions of @darshankparmar 's repository.
