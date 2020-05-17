from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "Udacity Capstone Project | ND DevOps: Flask application: This is an updated version to test the Rolling update"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
