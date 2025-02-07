# T-SQL Basic Built-in Functions

## 1. LEN()
- **Description**: Returns the number of characters in a string, excluding trailing spaces.
- **Example**:
  ```sql
  SELECT LEN('Hello World') AS StringLength;
  -- Result: 11
  ```

## 2. LOWER()
- **Description**: Converts all characters in a string to lowercase.
- **Example**:
  ```sql
  SELECT LOWER('Hello World') AS LowerCaseString;
  -- Result: hello world
  ```

## 3. UPPER()
- **Description**: Converts all characters in a string to uppercase.
- **Example**:
  ```sql
  SELECT UPPER('Hello World') AS UpperCaseString;
  -- Result: HELLO WORLD
  ```

## 4. GETDATE()
- **Description**: Returns the current system date and time.
- **Example**:
  ```sql
  SELECT GETDATE() AS CurrentDateTime;
  -- Result: 2025-02-07 15:42:00.000
  ```

## 5. ISNULL()
- **Description**: Replaces `NULL` with a specified replacement value.
- **Example**:
  ```sql
  SELECT ISNULL(NULL, 'No Value') AS Result;
  -- Result: No Value
  ```

## 6. ROUND()
- **Description**: Rounds a number to a specified number of decimal places.
- **Example**:
  ```sql
  SELECT ROUND(123.4567, 2) AS RoundedNumber;
  -- Result: 123.46
  ```

## 7. CONVERT()
- **Description**: Converts an expression to a specified data type.
- **Example**:
  ```sql
  SELECT CONVERT(VARCHAR(10), GETDATE(), 120) AS ConvertedDate;
  -- Result: 2025-02-07 15:42:00
  ```

## 8. CAST()
- **Description**: Converts an expression to a specified data type.
- **Example**:
  ```sql
  SELECT CAST(123.45 AS INT) AS CastedNumber;
  -- Result: 123
  ```
