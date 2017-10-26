#!/bin/bash
pwd;find . -type d | sed -e 's;[^/]*/; /;g;s;/ ;   ;g;s;^ /$;.;;s; /;|-- ;g'
