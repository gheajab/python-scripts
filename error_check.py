try:
    with open("app.log", encoding="utf-8") as f:
        count = sum(1 for line in f if "ERROR" in line)
    print(f"Linii cu ERROR: {count}")
except FileNotFoundError:
    print("Fișierul nu există.")