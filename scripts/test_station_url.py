import requests
import json

# Charger les stations depuis le fichier JSON
with open('../stations.json', 'r') as file:
    stations = json.load(file)

def check_url(url):
    try:
        response = requests.head(url, allow_redirects=True)
        return response.status_code == 200
    except requests.RequestException:
        return False

for station in stations:
    exists = check_url(station["url"])
    if not exists:
        print(f"{station['name']} ({station['url']}): Does not exist")