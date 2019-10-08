# flask-app/app.py

import sys
from flask import Flask
app = Flask(__name__)

@app.route('/')
def info():
    return 'flask running on python {}'.format(sys.version)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

