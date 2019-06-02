from subprocess import *

def handler(input, context):
    process = Popen(["/opt/bin/tor", "--version"])
    status = process.wait()
    if status == 0:
        return dict(message="pass test")
    raise ValueError("error")
