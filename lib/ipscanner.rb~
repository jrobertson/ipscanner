#!/usr/bin/env ruby

# file: ipscanner.rb

require 'socket'
require 'timeout'

class IPScanner
  
  def self.scan(ip_base='192.168.1.', range=1..254, t=1)
    a = []
    (range).map{|i| Thread.new {a << i if pingecho(ip_base+i.to_s, t) }}.join
    sleep t + 0.25
    a.map{|x| ip_base + x.to_s}
  end
      
  def self.pingecho(host, timeout=5, service="echo")
    begin
      timeout(timeout) do
      s = TCPSocket.new(host, service)
      s.close
      end
    rescue Errno::ECONNREFUSED
      return true
    rescue Timeout::Error, StandardError
      return false
    end
    return true
  end
  
end
