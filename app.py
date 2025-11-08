import os
from flask import Flask

app  = Flask(__name__)

@app.route("/")
def hello():
    name = os.getenv("NAME", "World")
    return f"Hello {name} to first python app,, CICD successfull with github actions!!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)