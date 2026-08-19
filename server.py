from flask import Flask
from threading import Thread
import os

app = Flask(__name__)

@app.route('/')
def route():
    return "Bot is running on Render!"

def run():
    # Render assigns a port dynamically; we catch it here.
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)

def keep_alive():
    server = Thread(target=run)
    server.start()
