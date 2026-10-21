import subprocess
import platform

servers = ["192.168.1.10", "192.168.1.11", "192.168.1.12"]

def check_server(ip):
    if platform.system() == "Windows":
        cmd = ["ping", "-n", "1", "-w", "1000", ip]
    else:
        cmd = ["ping", "-c", "1", "-W", "1", ip]
    try:
        result = subprocess.run(
            cmd,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        return result.returncode == 0
    except FileNotFoundError:
        print("Comanda ping nu a fost găsită.")
        return False

for server in servers:
    status = "răspunde" if check_server(server) else "NU răspunde"
    print(f"{server} {status}")