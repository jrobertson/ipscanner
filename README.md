# Discovering recently added IP addresses on the LAN using the IPScanner gem

    require 'ipscanner'

    IPScanner.detect_new '192.168.4.'

output:

<pre>
scanning the network (192.168.4.x)
found 15 IP addresses
scan to detect new IP addresses? (y/n) y
found : ["192.168.4.123", "192.168.4.191"]
scan to detect new IP addresses? (y/n) y
found 17 IP addresses
scan to detect new IP addresses? (y/n) y
enter y or n
found : ["192.168.4.176"]
scan to detect new IP addresses? (y/n) y
found : ["192.168.4.191"]
scan to detect new IP addresses? (y/n) y
found 16 IP addresses
scan to detect new IP addresses? (y/n) y
no new IP addresses found
scan to detect new IP addresses? (y/n) n
</pre>

Note: The IP scanner isn't 100% fool-proof, as it depends upon finding IP addresses within a given time. IP addresses not found within the given time are excluded from the results. However, those IP addresses with a higher latency typically show up again on subsequent scan results as is shown above.

## Resources

* ipscanner https://rubygems.org/gems/ipscanner


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
