#!/usr/bin/env python 
#-*- coding=utf-8 -*- 
try: 
  import xml.etree.cElementTree as ET 
except ImportError: 
  import xml.etree.ElementTree as ET 
import sys 

import sys
try: 
  tree = ET.parse( sys.argv[1] )     
  root = tree.getroot()
except Exception, e: 
  print "Error:cannot parse file:{}".format( sys.argv[1] ) 
  sys.exit(1)

for project in root.findall( "project" ) :
  if( project.get( "name" ) == sys.argv[2] ) :
    print project.get( "revision" )
