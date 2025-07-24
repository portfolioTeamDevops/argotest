from flask import Flask, render_template, url_for

app = Flask(__name__)


@app.route('/watch_tv/series/<name>')
def series(name):
    image_url = None
    if name == "baruchi_pipelines":
        image_url = url_for('static', filename='baruchi_pipelines.png')
    return render_template("series.html", series_name=name, image_url=image_url)


@app.route('/healthz')
def healthz():
    return {"status": "ok"}
if __name__ == '__main__':
    app.run(host='0.0.0.0')
