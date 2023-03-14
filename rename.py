#!/usr/bin/python3
# -*- coding: utf-8 -*-

from bottle import *
import shutil

@post("/upload")
def postExample():
    try:
        dt = request.forms.dict
        print("dt:%s" % dt)
        filenames = dt.get('file.name')
        filepaths = dt.get("file.path")
        count = filenames.__len__()
        share_path = "/nginx/share/"
        for i in range(count):
            print("rename %s to %s" % (filepaths[i],  os.path.join(share_path, filenames[i])))
            target = os.path.join(share_path, filenames[i])
            shutil.move(filepaths[i], target)
            shutil.chown(target, "nginx", "root")
    except Exception as e:
        print("Exception:%s" % e)
        redirect("50x.html")
    redirect('/')

run(host='localhost', port=81)