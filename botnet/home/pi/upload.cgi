#!/usr/bin/env python
 
import cgitb; cgitb.enable()
import cgi, os, sys
 
 
env = os.environ
method = os.environ.get("REQUEST_METHOD")
 
print "Content-type:text/html;charset=utf-8"
print
# print "Hello", method
# cgi.print_environ()

UPLOADS = "/var/www/html/"
 
def upload (inputname, base_upload_dir, pathname=None):
    form = cgi.FieldStorage()
    path = None
    if (pathname != None) and form.getvalue(pathname):
        path = form.getvalue(pathname)
    if not form.has_key(inputname): return
    fileitem = form[inputname]
    if not fileitem.file: return
    upload_dir = base_upload_dir
    if path:
        upload_dir = os.path.join(upload_dir, path.strip("/"))
    fp = os.path.join(upload_dir, fileitem.filename)
    # log.write("uploading to path:{0} fp:{1}\n".format(upload_dir, fp))
    fout = file (fp, 'wb')
    bytes = 0
    while 1:
        chunk = fileitem.file.read(100000)
        if not chunk: break
        bytes += len(chunk)
        fout.write (chunk)
    fout.close()
    return bytes, fileitem.filename
 
if method == "POST":
    # with open("upload.log", "a") as log:
    result = upload("thefile", UPLOADS, "path")
    if result:
        bytes, filename = result
        print "{0} bytes written to {1}<br />".format(bytes, filename)
        print "<a href="">upload another</a>"
else:
    print """<!DOCTYPE html>
<html>
<head>
</head>
<body>
<form method="post" action="" enctype="multipart/form-data">
<input type="file" name="thefile" /><input type="submit" />
</form>
</body>
</html>
"""