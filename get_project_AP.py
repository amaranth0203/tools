#!/usr/bin/env python
#-*- coding=utf-8 -*-

proj_APs = {
    "PD1515BA"  : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=242&project=PD1515BA&hdversion=PD1515BAMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1515ba&startdate=&enddate=&apkversion=&page=1" , 
    "PD1516A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=240&project=PD1516A&hdversion=PD1516AMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=PD1516A&startdate=&enddate=&apkversion=&page=1" , 
    "PD1415D"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=196&project=PD1415D&hdversion=PD1415DMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1415D&startdate=&enddate=&apkversion=&page=1" , 
    "PD1602A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=284&project=PD1602A&hdversion=PD1602MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=+PD1602a&startdate=&enddate=&apkversion=&page=1" ,
    "PD1415BA"  : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=266&project=PD1415BA&hdversion=PD1415BAMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1415ba&startdate=&enddate=&apkversion=&page=1" , 
    "PD1501D"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=204&project=PD1501D&hdversion=PD1501DMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1501d&startdate=&enddate=&apkversion=&page=1" ,
    "TD1603"    : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=311&project=TD1603&hdversion=TD1603MA&findtype=chip&chipse=&allprojectinfo.chip=MSM8953&startdate=&enddate=&apkversion=&page=1" ,
    "PD1616A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=334&project=PD1616A&hdversion=PD1616MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1616a&startdate=&enddate=&apkversion=&page=1" ,
    "PD1616_slf": "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=334&project=PD1616A&hdversion=PD1616MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1616a&startdate=&enddate=&apkversion=&page=1" ,
    "PD1610"    : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=318&project=PD1610&hdversion=PD1610MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=pd1610&startdate=&enddate=&apkversion=&page=1" ,
    "PD1603A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=289&project=PD1603A&hdversion=PD1603MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=+PD1603A&startdate=&enddate=&apkversion=&page=1" ,
    "TD1603_slf": "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=311&project=TD1603&hdversion=TD1603MA&findtype=chip&chipse=&allprojectinfo.chip=MSM8953&startdate=&enddate=&apkversion=&page=1" ,
    "TD1604"    : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=336&project=TD1604&hdversion=TD1604MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=td1604&startdate=&enddate=&apkversion=&page=1" , 
    "PD1617A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=337&project=PD1617A&hdversion=PD1617MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=+PD1617A&startdate=&enddate=&apkversion=&page=1" ,
    "PD1619A"   : "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=346&project=PD1619A&hdversion=PD1619MA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=+PD1619A&startdate=&enddate=&apkversion=&page=1" ,
}

def test( ) :
    import os
    import urllib  
    import urllib2  
    import cookielib  
    pass
    headers = {
        "Host": "192.168.2.125:8080",
        "User-Agent" : "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0" , 
        "Accept": "application/json, text/javascript, */*; q=0.01",
        "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
        "Accept-Encoding": "gzip, deflate",
        "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8" ,
        "X-Requested-With" : "XMLHttpRequest" ,
        "Referer": "http://192.168.2.125:8080/smartsys/",
        "Content-Length" : "39" ,
        "Cookie": "JSESSIONID=C7145D3848D4AE05E66849C92D963A97" ,
        # "Connection": "keep-alive",
    }
    data = {
        "uid" : "qiyunhu" ,
        "password" : "python" ,
        "siteno" : "main" ,
    }
    data = urllib.urlencode(data) 

    url1 = "http://192.168.2.125:8080/smartsys/userlogin.action"
    url2 = "http://192.168.2.125:8080/smartsys/externalInfoProject.action?idx=240&project=PD1516A&hdversion=PD1516AMA&findtype=unifiedProject&unifiedProjectse=&allprojectinfo.unifiedProject=PD1516A&startdate=&enddate=&apkversion=&page=1"
    cj = cookielib.CookieJar()
    opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj),urllib2.ProxyHandler({}))
    opener.open(url1, data)
    resp = opener.open( proj_APs[ os.getenv( 'PROJECT_NAME' ).split( '/' )[-1] ] )
    return resp.read().strip()

def getAP( html ) :
    from lxml import etree
    import lxml.html
    html = lxml.html.fromstring( html )
    results = html.xpath( "//input[@id='AP']" )
    return results[0].value

def print_and_log_to_file( AP_addr ) :
    import datetime
    log_file_name = "AP.log"
    print AP_addr
    #print datetime.datetime.now( )
    with open( log_file_name , "a+" ) as f :
        f.write( "\r\n" )
        f.write( str( datetime.datetime.now( ) ).split( '.' )[0] ) 
        f.write( "\r\n" )
        f.write( AP_addr )
        f.write( "\r\n" )

def check_pwd( ) :
    import os
    if not os.getcwd( ).strip( '/' ) == os.getenv( 'w' ).strip( '/' ):
        print( '[-] cd $w first' ) ;
        exit( 1 )

if __name__ == "__main__" :
    check_pwd( )
    print_and_log_to_file( getAP( test( ) ) )
