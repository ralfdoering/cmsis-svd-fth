#!/bin/bash

xsltproc extract.xsl $@ | sed -e 's/0x/\$/gi' 
