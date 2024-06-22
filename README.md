## App link
🔗 https://drive.google.com/file/d/19iJy1zTaVIfYR-ltDsV7Ob98Qfn9pMci/view?usp=sharing

## Video Output
[Recording 2024-06-22 110945.zip](https://github.com/user-attachments/files/15936329/Recording.2024-06-22.110945.zip)

## Documentation

## LoginPage

The `LoginPage` in this Flutter application allows users to sign in using their email and password. It features the following functionalities:

- **Email and Password Input**: Users can input their email and password to log in. The email is validated to ensure it follows the correct format.
- **Password Visibility Toggle**: Users can toggle the visibility of their password to ensure they are typing it correctly.
- **Forgot Password**: Provides a button that navigates to the `ForgotPasswordPage` for users who need to reset their password.
- **Login Process**: 
  - The login process includes a 2-second delay to simulate a loading period.
  - Displays a loading indicator while logging in.
  - On successful login, the user is navigated to the `HomePage`.
  - On failure, appropriate error messages are displayed using a `SnackBar`.
- **Sign Up Navigation**: Users without an account can navigate to the `SignUpPage` to create a new account.
- **UI Design**: 
  - The page has a vibrant design with deep purple as the primary color and light grey for contrast.
  - The input fields and buttons are styled for a modern and clean look.


## SignUpPage

The `SignUpPage` in this Flutter application enables users to create a new account with the following features:

- **User Input Fields**: 
  - First Name
  - Last Name
  - Email
  - Password
  - Confirm Password
- **Profile Picture Selection**: Users can select a profile picture from their gallery.
- **Email Validation**: The email input is validated using a regular expression to ensure it is in the correct format.
- **Password Validation**: Checks that the password and confirm password fields match before allowing account creation.
- **Password Visibility Toggle**: Users can toggle the visibility of their password and confirm password fields.
- **Account Creation Process**:
  - Upon successful form submission, the user's profile picture is uploaded to Firebase Storage.
  - The user account is created in Firebase Authentication.
  - User details, including the profile picture URL, are stored in Firestore.
  - A success message is displayed, and the user is navigated to the `HomePage`.
  - In case of errors, appropriate error messages are displayed using a `SnackBar`.
- **Sign-Up Feedback**: 
  - Displays a loading indicator while the account is being created.
  - Notifies the user upon successful account creation or if an error occurs.
- **Navigation**:
  - Provides a link to navigate back to the `LoginPage` if the user already has an account.
- **UI Design**:
  - The page has a vibrant design with deep purple as the primary color and light grey for contrast.
  - The input fields, buttons, and profile picture selection are styled for a modern and clean look.

This page ensures a smooth and user-friendly experience for new users to sign up and create their accounts.


## ForgotPasswordPage

The `ForgotPasswordPage` in this Flutter application allows users to reset their password with the following features:

- **User Input Field**: 
  - Email
- **Email Validation**: Ensures that the email entered is in a valid format using a regular expression.
- **Password Reset Process**:
  - Sends a password reset email to the user's email address using Firebase Authentication.
  - Displays a success message indicating that the password reset email has been sent.
  - If the email is invalid or an error occurs, an appropriate error message is displayed using a `SnackBar`.
- **Retry Mechanism**:
  - Implements a countdown timer to prevent users from sending multiple password reset emails within a short period.
  - Disables the reset button for 60 seconds after a reset email is sent and shows the remaining time.
- **Navigation**:
  - Provides a link to navigate back to the `LoginPage` if the user remembers their password.
- **UI Design**:
  - The page has a vibrant design with deep purple as the primary color and light grey for contrast.
  - The input fields and buttons are styled for a modern and clean look.

This page ensures a user-friendly experience for users who need to reset their password.


## HomePage

The `HomePage` in this Flutter application serves as the main navigation hub for the user, featuring a variety of essential components and functionalities:

- **Navigation Components**:
  - **App Bar**:
    - **Menu Button**: Opens the navigation drawer.
    - **Account Button**: Navigates to the `AccountPage`.
    - **Notifications Button**: Reserved for future notifications functionality.
  - **Drawer**: 
    - A custom drawer for additional navigation options and user information.
  - **Bottom Navigation Bar**: 
    - Allows switching between different pages: Dashboard, Usage, History, and Support.
- **Pages**:
  - **DashboardPage**: Displays key metrics and user information.
  - **UsagePage**: Shows the user's usage statistics.
  - **HistoryPage**: Displays the user's history of activities.
  - **SupportPage**: Provides support and contact information.
- **UI Design**:
  - The app bar and bottom navigation bar are styled with a deep purple primary color for a cohesive and modern look.
  - The bottom navigation bar highlights the selected page with a deep purple color, while unselected items are grey.

This page ensures a seamless and user-friendly navigation experience within the app.


## DashboardPage

The `DashboardPage` in this Flutter application provides users with a comprehensive dashboard interface, featuring:

- **User Profile Display**:
  - Displays the user's profile image fetched from Firebase Storage.
  - Shows the user's first name dynamically retrieved from Firestore.

- **Quick Actions**:
  - Grid-based layout with various quick action buttons.
  - Actions include managing bills, disconnecting services, transferring data, service requests, complaints, updates, and connectivity statuses.

- **Billing Information**:
  - Displays detailed billing information in a structured format.
  - Provides links to navigate to a detailed view of paid bills.

- **UI Design**:
  - Utilizes a vibrant color scheme with deep purple as the primary color and contrasting shades for clarity.
  - Modern design elements with circular avatars, iconography, and consistent typography.

- **Integration with Firebase**:
  - Utilizes Firebase services for user authentication and database management.
  - Fetches user profile details and dynamically updates the UI using Firestore streams.

This page offers a user-friendly dashboard experience with intuitive navigation and real-time data updates for enhanced usability.


## AccountPage

The `AccountPage` in this Flutter application provides users with account management features, including:

- **User Profile Display**:
  - Displays the user's profile picture fetched from Firestore.
  - Shows the user's full name and email address.

- **Change Password**:
  - Allows users to navigate to the Change Password page for updating their password.

- **Delete Account**:
  - Provides a dialog confirmation before deleting the user account.
  - Deletes user data from Firestore and authentication records upon confirmation.
  - Signs out the user and navigates to the login page upon successful deletion.

- **Logout**:
  - Allows users to sign out directly from their account.

- **UI Design**:
  - Features an AppBar with a deep purple color scheme for consistent branding.
  - Utilizes ListTile widgets for clear and accessible navigation options.

- **Integration with Firebase**:
  - Uses Firebase Authentication for user management.
  - Retrieves and displays user data from Firestore in real-time using FutureBuilder.

This page ensures secure and efficient management of user accounts with integrated Firebase services for authentication and data storage.


## ChangePasswordPage

The `ChangePasswordPage` in this Flutter application allows users to securely change their account password with the following features:

- **Form Validation**:
  - Validates the input fields for the old password, new password, and confirmation.
  - Ensures that passwords match and are correctly entered before proceeding.

- **Password Security**:
  - Provides visibility toggles for each password field to show or hide the entered text for user convenience.

- **Firebase Authentication**:
  - Reauthenticates the user using their current credentials before allowing a password change.
  - Uses Firebase Authentication services to update the user's password securely.

- **Error Handling**:
  - Displays error messages using SnackBars if password change fails due to incorrect credentials or other issues.

- **UI Design**:
  - Features a simple and intuitive UI with an AppBar for navigation and a form layout for input fields and buttons.
  - Utilizes Material Design principles with elevated buttons and text form fields for clarity.

This page ensures a streamlined and secure process for users to update their passwords within the application.
