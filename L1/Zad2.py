import pyodbc
import csv

# ustawienia połączenia
server = '156.17.130.185,23333'
database = 'AdventureWorks2014'
username = 'BIStud'
password = 'BIStudP@s'

# nawiązanie połączenia
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)

# wykonanie zapytania
cursor = conn.cursor()
cursor.execute('SELECT TerritoryID, Name,CountryRegionCode, SalesYTD, SalesLastYear FROM Sales.SalesTerritory')

results = cursor.fetchall()

with open('results.csv', 'w', newline='') as csvfile:
    # tworzymy obiekt writer z ustawieniami formatowania CSV
    writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    # zapisujemy nagłówki kolumn
    writer.writerow([column[0] for column in cursor.description])

    # zapisujemy wyniki
    for row in results:
        writer.writerow(row)

# zamknięcie połączenia
conn.close()