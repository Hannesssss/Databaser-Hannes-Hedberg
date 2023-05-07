from sqlalchemy import create_engine, text

# Connect to the database
engine = create_engine('mssql+pyodbc://user:password@server/database')
conn = engine.connect()

# Get user input for search term
search_term = input("Enter a search term: ")

# Prepare SQL query with parameterized input to protect against SQL injection
query = text("SELECT Book.Title, Inventory.Num, Stores.Name "
             "FROM Book "
             "JOIN Inventory ON Book.ISBN13 = Inventory.ISBN13 "
             "JOIN Stores ON Inventory.StoreID = Stores.StoreID "
             "WHERE Book.Title LIKE :search_term")
query = query.bindparams(search_term=f'%{search_term}%')

# Execute query and print results
result = conn.execute(query)
for row in result:
    print(f"Title: {row['Title']}, Copies available: {row['Num']}, Store: {row['Name']}")

# Close database connection
conn.close()