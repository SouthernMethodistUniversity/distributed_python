import segno

def make_qr(url, image):
    qr = segno.make_qr(url)
    qr.save(image, scale=16)

make_qr("https://southernmethodistuniversity.github.io/parallel_python/intro.html", 
        "../docs/parallel_python_qr.png")

