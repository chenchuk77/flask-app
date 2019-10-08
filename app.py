# flask-app/app.py

import sys
import os
from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route('/')
def info():
    return jsonify(
            pythonVersion = sys.version.split(' ')[0],
            containerId   = os.environ['HOSTNAME'],
            environment   = os.environ['TARGET_ENVIRONMENT']
    )

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

