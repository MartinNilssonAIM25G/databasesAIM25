from sqlalchemy import create_engine, text

engine = create_engine(
    "mssql+pyodbc://localhost/Bokhandel"
    "?driver=ODBC+Driver+17+for+SQL+Server"
    "&trusted_connection=yes"
)

def search_books(search_term, conn):
    query = text("SELECT ISBN13, Titel, Pris FROM Böcker WHERE Titel LIKE :search")
    result = conn.execute(query, {"search": f"%{search_term}%"})
    rows = result.fetchall()

    for row in rows:
        print(f"\n{row.Titel} - {row.ISBN13} - {row.Pris:0f} kr")
        show_stock(row.ISBN13, conn)

def show_stock(isbn13, conn):
    query = text("""
                 SELECT b.Butiksnamn, ls.Antal
                 FROM LagerSaldo ls
                 JOIN Butiker b ON ls.ButikID = b.ButikID
                 WHERE ls.ISBN13 = :isbn
                 """)
    
    result = conn.execute(query, {"isbn": isbn13})
    for row in result:
        print(f" {row.Butiksnamn}: {row.Antal}st i lager")

def main():
    try:
        with engine.connect() as conn:
            print("Ansluten till Bokhandel!")
            while True:
                
                print("\n1. Sök bok")
                print("2. Avsluta")

                val = input("Val: ")

                if val == "1":
                    search_books(input("Vilken bok vill du söka efter?: "), conn)
                elif val == "2":
                    print("Hejdå!") 
                    break
                else:
                    print("Ogiltligt val")

    except Exception as e:
        print(f"Kunde inte ansluta: {e}")

if __name__ == "__main__":
    main()