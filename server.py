from flask import Flask, jsonify, render_template
import subprocess
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/temps')
def get_temps():
    result = subprocess.run(['sensors'], capture_output=True, text=True)
    found_spd = False
    for line in result.stdout.splitlines():
        if 'Tctl' in line:
            parts = (line.split())
            CPUtemp = parts[1]
            CPUtemp = CPUtemp.replace('+', '')
            CPUtemp = CPUtemp.replace('°C', '')
        if 'edge' in line:
            parts = (line.split())
            IGPUtemp = parts[1]
            IGPUtemp = IGPUtemp.replace('+', '')
            IGPUtemp = IGPUtemp.replace('°C', '')
        if 'spd5118' in line:
            found_spd = True
        if found_spd and 'temp1' in line:
            parts = (line.split())
            RAMtemp = parts[1]
            RAMtemp = RAMtemp.replace('+', '')
            RAMtemp = RAMtemp.replace('°C', '')
            break
    GPUresult = subprocess.run(['nvidia-smi', '--query-gpu=temperature.gpu', '--format=csv,noheader'], capture_output=True, text=True)
    GPUtemp = GPUresult.stdout.strip()
    temps = {
        "CPU": CPUtemp,
        "GPU": GPUtemp,
        "iGPU": IGPUtemp,
        "RAM": RAMtemp
    }
    return jsonify(temps)
app.run(host='0.0.0.0', port=8888)
