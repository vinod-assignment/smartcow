from flask import Flask, jsonify

import psutil

app = Flask(__name__)



@app.route('/stats')

def get_stats():

    cpu_usage = psutil.cpu_percent(interval=1)

    mem_usage = psutil.virtual_memory().percent

    return jsonify({'cpu_usage': cpu_usage, 'mem_usage': mem_usage})

if __name__ == "__main__":

    app.run(host="0.0.0.0", port=8000)
