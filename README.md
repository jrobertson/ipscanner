# Pinging a range of ip addresses with ipscanner

    require 'ipscanner'

    # scan all ip addresses ranging from 192.168.1.1 - 192.168.1.254
    a = IPScanner.scan

    # scan ip addresses 192.168.1.1 - 192.168.1.100 with a timeout of 1 second
    a = IPScanner.scan('192.168.1.', 1..100,1)

    # scan ip addresses 192.168.1.1, 192.168.1.104, and 192.168.1.112
    #   with a timeout of 2 seconds
    a = IPScanner.scan('192.168.1.', [1,104,112],2) 

ipaddress gem ping
