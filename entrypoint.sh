#!/bin/sh
if [ -n "$1" ]; then
  echo $1 && python $1
else
  FLASK_APP=app.py flask run -h 0.0.0.0 -p ${PORT}
fi
