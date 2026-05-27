# Product Backlog — Chicaffe

## Product Goal

> Develop a comprehensive cafeteria management system that enables efficient administration of users, inventory, tables, orders, and reports — optimizing daily operations, reducing manual errors, improving stock control, and increasing service speed for Chicaffe customers.

---

## Epics

| ID | Epic | Priority | User Stories | Story Points |
|---|---|---|---|---|
| EP-01 | Authentication | High | US-01, US-02, US-03, US-04 | 13 SP |
| EP-02 | User Management | High | US-05, US-06 | 5 SP |
| EP-03 | Products & Inventory | High | US-07, US-08, US-09, US-10 | 17 SP |
| EP-04 | Tables | Medium | US-11 | 5 SP |
| EP-05 | Orders | High | US-12, US-13, US-14, US-15 | 26 SP |
| EP-06 | Reports | Medium | US-16 | 8 SP |
| EP-07 | Enhancements & Polish | Medium | US-17, US-18, US-19, US-20, US-21, US-22 | 36 SP |

---

# EPICS

## Epic 1 — Authentication `EP-01`

---

### US-CC-01-01 · User Registration by Administrator

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to register new users with name, email, password, and role **so that** staff members can access the system with the appropriate permissions. |

#### Input Fields

| Field | Type | Required | Constraints |
|---|---|---|---|
| Full Name | Text | Yes | 3–100 characters. Alphabetic characters, spaces, and hyphens only. No digits or special characters. |
| Email Address | Email | Yes | Must follow RFC 5322 format (`user@domain.tld`). Must be unique in the system. Maximum 254 characters. |
| Password | Password | Yes | 8–64 characters. Must include at least one uppercase letter, one lowercase letter, one digit, and one special character (`!@#$%^&*`). |
| Confirm Password | Password | Yes | Must match the value entered in the Password field exactly. |
| Role | Select | Yes | Must be one of the predefined values: `Administrator` or `Employee`. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful registration with valid data
    Given the administrator is on the user registration form
    When all required fields are completed with valid data according to the field constraints
    And the form is submitted
    Then the system must save the new user account in the database with the assigned role
    And the password must be stored as a cryptographic hash (bcrypt, minimum cost factor 10)
    And the system must display the message "User registered successfully"
    And the new user must appear immediately in the registered users list

  Scenario: Registration with a duplicate email address
    Given a user account with email "staff@chicaffe.com" already exists in the system
    When the administrator attempts to register a new user with the same email address
    Then the system must reject the submission before contacting the database
    And the system must display the message "This email address is already registered"
    And no new account must be created in the database

  Scenario: Registration with an invalid email format
    Given the administrator is on the user registration form
    When an email address is entered that does not conform to the format "user@domain.tld"
    Then the system must reject the submission
    And the Email field must be highlighted with a visual error indicator
    And the system must display the message "Please enter a valid email address (e.g. name@domain.com)"

  Scenario: Password does not meet security requirements
    Given the administrator is on the user registration form
    When a password is entered that is missing an uppercase letter, a digit, or a special character
    Then the system must reject the submission
    And the Password field must be highlighted with a visual error indicator
    And the system must display the message "Password must be at least 8 characters and include one uppercase letter, one number, and one special character"

  Scenario: Confirm Password does not match Password
    Given the administrator has entered a valid password in the Password field
    When a different value is entered in the Confirm Password field
    Then the system must reject the submission
    And the Confirm Password field must be highlighted with a visual error indicator
    And the system must display the message "Passwords do not match"

  Scenario: Submission with one or more empty required fields
    Given the administrator is on the user registration form
    When the form is submitted with one or more required fields left empty
    Then the system must halt the submission without sending a server request
    And each empty field must be highlighted with a visual error indicator
    And the system must display a specific validation message adjacent to each empty field
    And the form must retain all data previously entered in the remaining fields

  Scenario: Full Name contains invalid characters
    Given the administrator is on the user registration form
    When a full name is entered that contains digits or special characters (e.g. "John123" or "Ana@Doe")
    Then the system must reject the submission
    And the Full Name field must be highlighted with a visual error indicator
    And the system must display the message "Full name must contain letters and spaces only"

  Scenario: No role is selected
    Given the administrator is on the user registration form
    When the form is submitted without selecting a role from the available options
    Then the system must reject the submission
    And the Role field must be highlighted with a visual error indicator
    And the system must display the message "Please select a role for this user"

  Scenario: Loading indicator displayed during processing
    Given the administrator has completed the form with valid data
    When the form is submitted and the system is processing the request
    Then the system must display a loading indicator on the submit button
    And the system must show the message "Creating account, please wait..."
    And the submit button must be disabled to prevent duplicate submission attempts

  Scenario: Registration with a slow or degraded connection
    Given the administrator has submitted a valid registration form
    When the server response is delayed beyond 5 seconds
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the system must not discard the submitted form data during the delay

  Scenario: Registration attempt without internet connection
    Given the administrator has completed the registration form
    When the form is submitted without an active internet connection
    Then the system must display the message "No internet connection. Please check your network settings."
    And the system must preserve all data entered in the form fields
    And the system must provide a visible option to retry the submission once connectivity is restored
```

---

### US-Cc-01-02 · User Login

| Field | Detail |
|---|---|
| **User Story** | **As a** registered user, **I want** to log in with my email and password **so that** I can access the system dashboard. |

#### Input Fields

| Field | Type | Required | Constraints |
|---|---|---|---|
| Email Address | Email | Yes | Must follow format `user@domain.tld`. Maximum 254 characters. |
| Password | Password | Yes | Non-empty. Submitted as plaintext and validated against stored hash on the server. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful login with valid credentials
    Given a registered user is on the login page
    When a valid email address and the correct password are entered and the form is submitted
    Then the system must authenticate the user against the stored password hash
    And the system must create a secure session token for the authenticated user
    And the session token must be stored in an HttpOnly cookie or equivalent secure storage
    And the system must redirect the user to the main dashboard

  Scenario: Login with an invalid email format
    Given a user is on the login page
    When an email address is entered that does not conform to the format "user@domain.tld"
    Then the system must reject the submission without sending a server request
    And the Email field must be highlighted with a visual error indicator
    And the system must display the message "Please enter a valid email address"

  Scenario: Login with unrecognized email or incorrect password
    Given a user is on the login page
    When an email address that does not exist in the system is entered
    Or when a registered email is entered with an incorrect password
    Then the system must reject the authentication attempt
    And the system must display the generic message "Invalid email or password" without specifying which field is incorrect
    And the password field must be cleared
    And the user must remain on the login page
    And no session must be created

  Scenario: Account locked after repeated failed attempts
    Given a user has submitted incorrect credentials 5 consecutive times for the same account
    When a sixth login attempt is made within the lockout window
    Then the system must block the authentication attempt
    And the system must display the message "Your account has been temporarily locked due to too many failed attempts. Please try again in 15 minutes."
    And the system must log the event internally with the timestamp and IP address

  Scenario: Submission with empty fields
    Given a user is on the login page
    When the form is submitted with one or more fields left empty
    Then the system must halt the submission without sending a server request
    And each empty field must be highlighted with a visual error indicator
    And the system must display the message "All fields are required"

  Scenario: Password field is empty but email is provided
    Given a user has entered a valid email address on the login page
    When the form is submitted with the password field empty
    Then the system must reject the submission without a server request
    And the Password field must be highlighted with a visual error indicator
    And the system must display the message "Password is required"

  Scenario: Loading indicator displayed during authentication
    Given the user has entered valid credentials on the login page
    When the form is submitted and the system is processing the authentication request
    Then the system must display a loading indicator on the submit button
    And the system must show the message "Signing in..."
    And the submit button must be disabled to prevent multiple submission attempts

  Scenario: Login with a slow or degraded connection
    Given the user has submitted valid credentials
    When the authentication request is delayed beyond 5 seconds
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the entered credentials must not be discarded during the delay

  Scenario: Login attempt without internet connection
    Given the user is on the login page with credentials entered
    When the form is submitted without an active internet connection
    Then the system must display the message "No internet connection. Please check your network settings."
    And the email address entered must be preserved in the form
    And the system must provide a visible option to retry the request once connectivity is restored
```

---

### US-Cc-01-03 · Logout

| Field | Detail |
|---|---|
| **User Story** | **As an** authenticated user, **I want** to log out at any time **so that** my session is safely terminated. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful logout
    Given the user has an active authenticated session
    When the user clicks the "Logout" button
    Then the system must invalidate the session token on the server
    And the system must clear all session tokens and authentication data from the client (cookies, localStorage, sessionStorage)
    And the system must redirect the user to the login page
    And the system must display the message "You have been logged out successfully"
    And the user must not be able to navigate back to protected pages using the browser's back button

  Scenario: Loading indicator displayed during logout processing
    Given the user has clicked the "Logout" button
    When the system is processing the session termination request
    Then the system must display a loading indicator
    And the system must show the message "Signing out..."
    And the system must prevent the user from navigating or triggering other actions during the process

  Scenario: Logout with a slow or degraded connection
    Given the user has initiated a logout request
    When the server response is delayed beyond 5 seconds
    Then the system must maintain the loading indicator for the duration of the request
    And the system must display the message "This is taking longer than expected. Please wait..."
    And the session must not remain active if the server request fails to complete

  Scenario: Logout attempt without internet connection
    Given the user attempts to log out without an active internet connection
    When the logout request cannot reach the server
    Then the system must clear all local session data and tokens from the client immediately
    And the system must display the message "No internet connection. You have been logged out locally."
    And the system must redirect the user to the login page
    And the server-side session must be invalidated as soon as connectivity is restored
```

---

### US-Cc-01-04 · Protected Routes

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** protected pages to be accessible only by authenticated users **so that** unauthorized access is prevented. |

#### Acceptance Criteria

```gherkin
  Scenario: Access attempt to a protected route without an active session
    Given the user does not have an active authenticated session
    When the user attempts to navigate directly to a protected page via URL
    Then the system must block access to the requested page
    And the system must redirect the user to the login page
    And the system must display the message "Access denied. Please log in to continue."

  Scenario: Access to a protected route with a valid active session
    Given the user has a valid and active authenticated session
    When the user navigates to any protected page
    Then the system must grant access and render the requested page normally
    And the navigation flow must not be interrupted

  Scenario: Session expiration during active use
    Given the user has an authenticated session that has expired due to inactivity
    When the user attempts to access or interact with a protected page
    Then the system must invalidate the expired session
    And the system must redirect the user to the login page
    And the system must display the message "Your session has expired. Please log in again."
```

---

## Epic 2 — User Management `EP-02`

---

### US-cc-02-05 · View Users List

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to see all registered users displayed in a table **so that** I have full visibility of the system's staff. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful display of all registered users
    Given the administrator is on the user management page
    When the page finishes loading
    Then the system must display all registered users in a structured table
    And the table must include the following columns: full name, email address, role, and account status

  Scenario: No registered users exist in the system
    Given the system has no registered user accounts
    When the administrator navigates to the user management page
    Then the system must display the message "No users have been registered yet"
    And the table structure must remain visible but with no data rows

  Scenario: Loading indicator while retrieving user data
    Given the administrator has navigated to the user management page
    When the system is fetching user records from the database
    Then the system must display a loading indicator
    And the system must show the message "Loading users..."
    And the table must not render incomplete or partial data during retrieval
```

---

### US-Cc-02-06 · Search Users by Name

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to search for users by name **so that** I can quickly locate a specific staff member. |

#### Acceptance Criteria

```gherkin
  Scenario: Search returns one or more matching results
    Given the users list is fully loaded on the user management page
    When the administrator types a full or partial name in the search input field
    Then the system must filter the table in real time (within 300ms of each keystroke)
    And only user records whose names match the search input must be displayed
    And the search must be case-insensitive

  Scenario: Search returns no matching results
    Given the users list is fully loaded on the user management page
    When the administrator enters a name that does not correspond to any registered user
    Then the system must display the message "No users found matching your search"
    And the table must display no data rows
```

---

## Epic 3 — Products & Inventory `EP-03`

---

### US-Cc-03-07 · Create Product

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to create new products with a name, price, and initial stock quantity **so that** the product catalog stays up to date. |

#### Input Fields

| Field | Type | Required | Constraints |
|---|---|---|---|
| Product Name | Text | Yes | 2–100 characters. Must be unique in the catalog. |
| Price | Decimal | Yes | Must be a positive number greater than 0. Maximum 2 decimal places. |
| Initial Stock | Integer | Yes | Must be a non-negative integer (≥ 0). |

#### Acceptance Criteria

```gherkin
  Scenario: Successful product creation
    Given the administrator is on the product registration form
    When all required fields are completed with valid data and the form is submitted
    Then the system must save the new product record in the database
    And the system must display the message "Product created successfully"
    And the new product must appear immediately in the product catalog list

  Scenario: Product creation with a duplicate product name
    Given a product named "Espresso" already exists in the catalog
    When the administrator attempts to create a new product with the same name
    Then the system must reject the submission
    And the Product Name field must be highlighted with a visual error indicator
    And the system must display the message "A product with this name already exists"

  Scenario: Product creation with an invalid price value
    Given the administrator is on the product registration form
    When a price of zero, a negative number, or a non-numeric value is entered
    Then the system must reject the submission
    And the Price field must be highlighted with a visual error indicator
    And the system must display the message "Price must be a positive number greater than zero"

  Scenario: Product creation with an invalid stock quantity
    Given the administrator is on the product registration form
    When a negative number or a non-integer value is entered in the stock field
    Then the system must reject the submission
    And the Initial Stock field must be highlighted with a visual error indicator
    And the system must display the message "Stock quantity must be a whole number of zero or greater"

  Scenario: Submission with one or more empty required fields
    Given the administrator is on the product registration form
    When the form is submitted with one or more required fields left empty
    Then the system must halt the submission without sending a server request
    And each empty field must be highlighted with a visual error indicator
    And the system must display a specific validation message adjacent to each empty field
```

---

### US-Cc-03-08 · Edit and Delete Product

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to edit and delete existing products **so that** the product catalog remains accurate and current. |

#### Acceptance Criteria — Edit Product

```gherkin
  Scenario: Successful product edit
    Given a product record exists in the system catalog
    When the administrator opens the edit form, the system must pre-populate all fields with the current product data
    And the administrator modifies one or more fields with valid data and saves the changes
    Then the system must validate all fields before sending the request to the server
    And the system must update the product record in the database
    And the system must display the message "Product updated successfully"
    And the updated information must be immediately reflected in the catalog list

  Scenario: Edit product with a duplicate name
    Given a product named "Latte" already exists in the catalog with a different ID
    When the administrator edits another product and changes its name to "Latte"
    Then the system must reject the submission
    And the Product Name field must be highlighted with a visual error indicator
    And the system must display the message "A product with this name already exists"
    And no changes must be saved to the database

  Scenario: Edit product with an invalid price value
    Given the administrator has opened the edit form for an existing product
    When a price of zero, a negative number, or a non-numeric value is entered
    Then the system must reject the submission
    And the Price field must be highlighted with a visual error indicator
    And the system must display the message "Price must be a positive number greater than zero"
    And the original product data must remain unchanged in the database

  Scenario: Edit product with an invalid stock quantity
    Given the administrator has opened the edit form for an existing product
    When a negative number or a non-integer value is entered in the stock field
    Then the system must reject the submission
    And the Initial Stock field must be highlighted with a visual error indicator
    And the system must display the message "Stock quantity must be a whole number of zero or greater"

  Scenario: Edit form submitted with one or more empty required fields
    Given the administrator has opened the edit form for an existing product
    When the form is submitted with one or more required fields cleared or empty
    Then the system must halt the submission without sending a server request
    And each empty field must be highlighted with a visual error indicator
    And the system must display a specific validation message adjacent to each empty field

  Scenario: Product record deleted by another user while the edit form is open
    Given the administrator has the edit form open for product ID "P-042"
    When the same product has been deleted by another session before the form is saved
    And the administrator submits the edit form
    Then the system must detect the 404 response from the server
    And the system must display the message "This product no longer exists. It may have been deleted by another user."
    And the system must close the edit form and refresh the catalog list

  Scenario: Server error during product edit
    Given the administrator has submitted valid changes for an existing product
    When the server returns an unexpected error (5xx)
    Then the system must display the message "An unexpected error occurred. Your changes were not saved. Please try again."
    And the form must remain open with the entered data intact
    And the original product data must remain unchanged in the database
```

#### Acceptance Criteria — Delete Product

```gherkin
  Scenario: Successful product deletion with confirmation
    Given a product record exists in the system catalog
    When the administrator clicks the Delete button for that product
    Then the system must display a confirmation dialog with the message "Are you sure you want to delete this product? This action cannot be undone."
    And when the administrator confirms the action
    Then the system must send a DELETE request to the server using the product's unique ID
    And the system must permanently remove the product record from the database
    And the system must display the message "Product deleted successfully"
    And the product must no longer appear in the catalog list

  Scenario: Product deletion cancelled by the administrator
    Given a product record exists in the system catalog
    When the administrator clicks the Delete button and then cancels the action in the confirmation dialog
    Then no DELETE request must be sent to the server
    And the product record must remain unchanged in the database and the catalog list

  Scenario: Deletion of a product that was already deleted by another user
    Given the administrator attempts to delete product ID "P-042"
    When the same product has already been deleted in another session
    And the server returns a 404 response
    Then the system must display the message "This product no longer exists. It may have already been deleted."
    And the system must remove the stale entry from the catalog list automatically
    And no further error dialogs must be shown to the user

  Scenario: Frontend displays product after successful backend deletion (sync failure)
    Given the server has confirmed successful deletion of a product
    When the frontend fails to update the catalog list correctly
    Then the system must attempt to re-fetch the catalog data from the server
    And the deleted product must not appear in the refreshed list
    And if the re-fetch also fails, the system must display the message "The list could not be refreshed. Please reload the page."

  Scenario: Server error during product deletion
    Given the administrator has confirmed deletion of a product
    When the server returns an unexpected error (5xx)
    Then the system must display the message "An unexpected error occurred. The product could not be deleted. Please try again."
    And the product record must remain in the database and the catalog list
    And the confirmation dialog must close without further action
```

---

### US-Cc-03-09 · Restock Inventory

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to restock products by adding units **so that** inventory levels are always accurate. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful inventory restock
    Given a product record exists in the system
    When the administrator enters a valid positive integer as the restock quantity and confirms the operation
    Then the system must increment the product's stock level by the entered amount
    And the system must display the message "Stock updated successfully"
    And the updated stock value must be reflected immediately in the product catalog list

  Scenario: Invalid restock quantity entered
    Given a product record exists in the system
    When the administrator enters a value of zero, a negative number, a decimal, or a non-numeric value
    Then the system must reject the submission
    And the system must display the message "Restock quantity must be a whole number greater than zero"
    And the product's stock level must remain unchanged
```

---

### US-Cc-03-10 · Out of Stock Visual Indicator

| Field | Detail |
|---|---|
| **User Story** | **As a** user, **I want** to visually identify out-of-stock products **so that** I can avoid attempting to order unavailable items. |

#### Acceptance Criteria

```gherkin
  Scenario: Product with zero stock displayed in the catalog
    Given a product has a current stock level of zero
    When the product is displayed in the catalog or product list
    Then the system must render a clearly visible "Out of Stock" badge on that product entry
    And the badge must be visually distinct from available product indicators (e.g. different color or icon)

  Scenario: Out-of-stock product cannot be added to an active order
    Given a product has a current stock level of zero
    When the user views the product in the order creation interface
    Then the system must disable the add-to-order button for that product
    And the system must display the message "This product is currently out of stock"
```

---

# EPICS

## Epic 4 — Tables `EP-04`

---

### US-Cc-04-11 · Tables Management (CRUD)

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to create, edit, and delete cafeteria tables **so that** orders can be accurately assigned to the corresponding physical tables. |

#### Input Fields

| Field | Type | Required | Constraints |
|---|---|---|---|
| Table Number | Integer | Yes | Must be a positive integer greater than 0. Must be unique. |
| Seating Capacity | Integer | Yes | Must be a positive integer between 1 and 50. |

#### Acceptance Criteria — Create Table

```gherkin
  Scenario: Successful table creation
    Given the administrator is on the tables management page
    When a valid and unique table number and a valid seating capacity are entered and the form is submitted
    Then the system must save the new table record in the database
    And the system must display the message "Table created successfully"
    And the new table must appear immediately in the tables list

  Scenario: Table creation with a duplicate table number
    Given a table with number "5" already exists in the system
    When the administrator attempts to create a new table with the same number
    Then the system must reject the submission
    And the Table Number field must be highlighted with a visual error indicator
    And the system must display the message "A table with this number already exists"

  Scenario: Table creation with an invalid table number
    Given the administrator is on the table creation form
    When a value of zero, a negative number, or a non-integer is entered in the Table Number field
    Then the system must reject the submission
    And the Table Number field must be highlighted with a visual error indicator
    And the system must display the message "Table number must be a positive integer"

  Scenario: Table creation with an invalid seating capacity
    Given the administrator is on the table creation form
    When a value outside the range 1–50 or a non-integer is entered in the Seating Capacity field
    Then the system must reject the submission
    And the Seating Capacity field must be highlighted with a visual error indicator
    And the system must display the message "Seating capacity must be a whole number between 1 and 50"

  Scenario: Submission with empty required fields
    Given the administrator is on the table creation form
    When the form is submitted with one or more required fields left empty
    Then the system must halt the submission without sending a server request
    And each empty field must be highlighted with a visual error indicator
    And the system must display a specific validation message adjacent to each empty field
```

#### Acceptance Criteria — Edit Table

```gherkin
  Scenario: Successful table edit
    Given a table record exists in the system
    When the administrator opens the edit form, all fields must be pre-populated with the current table data
    And the administrator modifies one or more fields with valid data and saves the changes
    Then the system must validate all fields before sending the request to the server
    And the system must update the record in the database
    And the system must display the message "Table updated successfully"
    And the updated details must be reflected immediately in the tables list

  Scenario: Edit table with a duplicate table number
    Given a table with number "3" already exists with a different record ID
    When the administrator edits another table and changes its number to "3"
    Then the system must reject the submission
    And the Table Number field must be highlighted with a visual error indicator
    And the system must display the message "A table with this number already exists"
    And no changes must be saved to the database

  Scenario: Edit table with invalid field values
    Given the administrator has opened the edit form for an existing table
    When an invalid value is entered in any required field (e.g. non-integer, out-of-range value)
    Then the system must reject the submission
    And the affected field must be highlighted with a visual error indicator
    And the system must display a specific validation message for each invalid field
    And the original table data must remain unchanged in the database

  Scenario: Table record deleted by another user while the edit form is open
    Given the administrator has the edit form open for a table
    When the same table has been deleted in another session before the form is saved
    And the administrator submits the edit form
    Then the system must detect the 404 response from the server
    And the system must display the message "This table no longer exists. It may have been deleted by another user."
    And the system must close the edit form and refresh the tables list

  Scenario: Server error during table edit
    Given the administrator has submitted valid changes for an existing table
    When the server returns an unexpected error (5xx)
    Then the system must display the message "An unexpected error occurred. Your changes were not saved. Please try again."
    And the form must remain open with the entered data intact
    And the original table data must remain unchanged in the database
```

#### Acceptance Criteria — Delete Table

```gherkin
  Scenario: Successful deletion of a table with no active orders
    Given a table record exists in the system with no active orders currently linked to it
    When the administrator clicks the Delete button for that table
    Then the system must display a confirmation dialog with the message "Are you sure you want to delete Table #[N]? This action cannot be undone."
    And when the administrator confirms the action
    Then the system must send a DELETE request to the server using the table's unique ID
    And the system must permanently remove the table record from the database
    And the system must display the message "Table deleted successfully"
    And the table must no longer appear in the tables list

  Scenario: Deletion attempt on a table with active linked orders
    Given a table record exists with one or more active orders currently assigned to it
    When the administrator attempts to delete that table
    Then the system must reject the deletion request
    And the system must display the message "This table cannot be deleted because it has active orders assigned to it"
    And no DELETE request must be sent to the server

  Scenario: Table deletion cancelled by the administrator
    Given a table record exists in the system
    When the administrator clicks the Delete button and then cancels the action in the confirmation dialog
    Then no DELETE request must be sent to the server
    And the table record must remain unchanged in the database and the tables list

  Scenario: Deletion of a table that was already deleted by another user
    Given the administrator attempts to delete a table
    When the server returns a 404 response because the table was already deleted in another session
    Then the system must display the message "This table no longer exists. It may have already been deleted."
    And the system must remove the stale entry from the tables list automatically

  Scenario: Frontend displays table after successful backend deletion (sync failure)
    Given the server has confirmed successful deletion of a table
    When the frontend fails to update the tables list correctly
    Then the system must attempt to re-fetch the tables data from the server
    And the deleted table must not appear in the refreshed list
    And if the re-fetch also fails, the system must display the message "The list could not be refreshed. Please reload the page."

  Scenario: Server error during table deletion
    Given the administrator has confirmed deletion of a table
    When the server returns an unexpected error (5xx)
    Then the system must display the message "An unexpected error occurred. The table could not be deleted. Please try again."
    And the table record must remain in the database and the tables list
```

---

## Epic 5 — Orders `EP-05`

---

### US-Cc-05-12 · Create Order

| Field | Detail |
|---|---|
| **User Story** | **As an** employee, **I want** to create a new order linked to a customer and a table **so that** customer requests are tracked from the start of service. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful order creation
    Given the employee is on the order creation form
    When a valid customer and an available table are selected and the form is submitted
    Then the system must register the new order in the database with the status "pending"
    And the system must display the message "Order created successfully"
    And the new order must appear in the active orders list

  Scenario: Order creation with missing required fields
    Given the employee is on the order creation form
    When the form is submitted without selecting a customer or a table
    Then the system must halt the submission
    And the system must display the message "Please select a customer and a table before creating the order"
```

---

### US-Cc-05-13 · Add Products to Order

| Field | Detail |
|---|---|
| **User Story** | **As an** employee, **I want** to add products to an active order with automatic inventory deduction **so that** stock levels are kept accurate at all times. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful addition of a product with available stock
    Given an active order exists and the selected product has sufficient available stock
    When the employee adds the product to the order with a specified quantity
    Then the system must register the product and quantity in the order record
    And the system must automatically deduct the specified quantity from the product's stock level
    And the product must appear in the order's item list with its corresponding subtotal

  Scenario: Attempt to add an out-of-stock product to an order
    Given a product has a current stock level of zero
    When the employee attempts to add that product to an active order
    Then the system must block the operation
    And the system must display the message "This product is currently out of stock and cannot be added to the order"
    And the order's item list and inventory levels must remain unchanged
```

---

### US-Cc-05-14 · Change Order Status

| Field | Detail |
|---|---|
| **User Story** | **As an** employee, **I want** to update the order status through valid transitions **so that** the progress of each order is accurately tracked. |

#### Acceptance Criteria

```gherkin
  Scenario: Valid forward status transition
    Given an active order is in a status that permits a forward transition
    When the employee changes the order to the next allowed status in the workflow
    Then the system must update the order's status record in the database
    And the system must display the message "Order status updated successfully"
    And the updated status must be reflected in the orders list

  Scenario: Invalid or backward status transition attempt
    Given an order has reached a terminal status such as "delivered" or "cancelled"
    When the employee attempts to change the order to a previous or disallowed status
    Then the system must reject the operation
    And the system must display the message "This status transition is not permitted"
    And the order's current status must remain unchanged
```

---

### US-Cc-05-15 · Cancel Order and Restore Inventory

| Field | Detail |
|---|---|
| **User Story** | **As an** employee, **I want** to cancel an active order and have the consumed stock automatically restored **so that** inventory remains accurate even when orders are cancelled. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful order cancellation with automatic stock restoration
    Given an active order contains one or more products with associated quantities
    When the employee initiates the cancellation and confirms the action
    Then the system must update the order's status to "cancelled" in the database
    And the system must automatically restore the inventory level of each product included in the order
    And the system must display the message "Order cancelled and inventory has been restored"

  Scenario: Cancellation attempt on a delivered order
    Given an order has a terminal status of "delivered"
    When the employee attempts to cancel that order
    Then the system must reject the operation
    And the system must display the message "Delivered orders cannot be cancelled"
    And both the order status and inventory levels must remain unchanged
```

---

## Epic 6 — Reports `EP-06`

---

### US-Cc-06-16 · Daily Sales Report

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to generate a daily sales report **so that** I can monitor revenue and order volume for any selected day. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful report generation with available sales data
    Given delivered orders exist in the system for the selected date
    When the administrator selects a date and generates the report
    Then the system must display the total sales amount for that day
    And the system must display the total number of completed orders
    And the system must display a breakdown of products sold with quantities and subtotals per item

  Scenario: Report generation for a date with no recorded sales
    Given no orders with a "delivered" status exist for the selected date
    When the administrator generates the report for that date
    Then the system must display the message "No sales data available for the selected period"
    And all summary fields must reflect a value of zero
```

---

# EPICS

## Epic 7 — Enhancements & Polish `EP-07`

---

### US-Cc-07-17 · Advanced Sales Reports with Charts

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to view interactive charts and apply date range filters to reports **so that** I can analyze sales trends more effectively. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful report generation using a date range filter
    Given the administrator is on the reports page
    When a valid start date and end date are selected and the report is generated
    Then the system must display the total sales amount, the number of orders, and the top-selling products for the specified period

  Scenario: Interactive charts rendered upon report generation
    Given a report has been successfully generated for a specified date range
    When the report results are displayed
    Then the system must render a bar chart representing sales aggregated by day
    And the system must render a pie chart representing the distribution of top-selling products
    And the system must render a line chart representing the cumulative sales trend over the period

  Scenario: Report generation for a date range with no recorded data
    Given no orders exist within the selected date range
    When the report is generated
    Then the system must display the message "No sales data available for the selected period"
    And no charts must be rendered
```

---

### US-Cc-07-18 · Order History and Search

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to search and filter past orders **so that** I can easily locate specific transactions in the system's history. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful display of all past orders
    Given the administrator accesses the order history page
    When the page finishes loading
    Then the system must display all past orders in a structured table
    And each record must include the order date, assigned table, total amount, and current status

  Scenario: Search and filter order history records
    Given the order history table is fully loaded
    When the administrator enters a value in the search field using an order ID, customer name, or date
    Then the system must filter the table in real time
    And only records matching the search criteria must be displayed

  Scenario: View detailed information for a specific order
    Given a specific order record exists in the order history
    When the administrator selects that order
    Then the system must display a detailed view containing all products, their quantities, unit prices, and the order subtotal
```

---

### US-Cc-07-19 · User Roles and Permissions

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to assign roles to users (Administrator or Employee) **so that** each person only has access to the system features they are authorized to use. |

#### Acceptance Criteria

```gherkin
  Scenario: Role assignment during user account creation
    Given the administrator is completing the user registration form
    When a role is selected from the available options (Administrator or Employee) and the form is submitted
    Then the system must save the assigned role in association with the user account in the database
    And the role must be visible in the user's profile within the users list

  Scenario: Role-based access restriction for the Employee role
    Given a user with an assigned role of "Employee" is authenticated and logged in
    When the user attempts to navigate to the user management or reports sections
    Then the system must deny access to those sections
    And the system must display the message "You do not have permission to access this section"

  Scenario: Unrestricted access for the Administrator role
    Given a user with an assigned role of "Administrator" is authenticated and logged in
    When the user navigates to any section of the system
    Then the system must grant full access without restrictions
    And all administrative features and data must be accessible
```

---

### US-Cc-07-20 · Export Reports (PDF / CSV)

| Field | Detail |
|---|---|
| **User Story** | **As an** administrator, **I want** to export generated reports in PDF and CSV formats **so that** I can share and archive sales data externally. |

#### Acceptance Criteria

```gherkin
  Scenario: Successful export of a report to CSV format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export CSV" button
    Then the system must generate and download a .csv file containing all report records
    And the file must include column headers corresponding to the report fields

  Scenario: Successful export of a report to PDF format
    Given a report has been successfully generated and contains data
    When the administrator clicks the "Export PDF" button
    Then the system must generate and download a formatted .pdf file containing the complete report
    And the file must include the report title, generation date, and all data rows

  Scenario: Export attempt when no report data is available
    Given the reports page has been loaded but no report has been generated
    When the administrator attempts to click an export button
    Then the system must disable both export buttons
    And the system must display the message "Generate a report before exporting"
```

---

### US-Cc-07-21 · Performance Optimization

| Field | Detail |
|---|---|
| **User Story** | **As a** developer, **I want** the system to load quickly and respond efficiently **so that** the user experience remains smooth even with large volumes of data. |

#### Acceptance Criteria

```gherkin
  Scenario: Page load time under normal operating conditions
    Given the system is operating under normal load conditions
    When a user navigates to any page within the system
    Then the page must be fully rendered and interactive within 2 seconds

  Scenario: Paginated data retrieval for large record sets
    Given the system contains more than 500 records in any given data table
    When a user loads a list of users, products, or orders
    Then the system must apply server-side pagination to the query
    And the system must load only the records for the current page without performance degradation
    And navigation controls must be available to access additional pages
```

---

### US-Cc-07-22 · Improved Error Handling

| Field | Detail |
|---|---|
| **User Story** | **As a** user, **I want** to receive clear and friendly error messages **so that** I understand what went wrong and can take the appropriate corrective action. |

#### Acceptance Criteria

```gherkin
  Scenario: Network connection error during any system operation
    Given the user is performing any action within the system
    When the request fails due to the absence of an internet connection
    Then the system must display the message "Connection error. Please check your internet connection."
    And the system must not lose any data the user was working with
    And the system must provide an option to retry the failed operation

  Scenario: Form validation error on submission
    Given a user is completing any form within the system
    When the form is submitted with incorrect, incomplete, or invalid data
    Then the system must halt the submission
    And the system must display specific and descriptive validation messages adjacent to each invalid field
    And the form must remain populated with the data the user had entered

  Scenario: Unexpected server-side error
    Given a user has triggered an operation that causes an unhandled server-side exception
    When the system receives an error response from the server
    Then the system must display the message "An unexpected error occurred. Please try again later."
    And the system must log the error details internally for diagnostic purposes
    And the user interface must remain stable and functional
```

---

*Document Version: 2.0 — Last updated: 2026*
