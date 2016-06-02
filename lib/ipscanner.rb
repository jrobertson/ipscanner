#!/usr/bin/env ruby

# file: ipscanner.rb

require 'socket'
require 'timeout'

class IPScanner
  
  def self.detect_new(ip_base=nil)
    
    ip_base = local_ip.ip_address[/\d+\.\d+\.\d+\./] unless ip_base
    
    puts "scanning the network (#{ip_base}x)"

    a1 = scan ip_base
    puts "found %d IP addresses" % a1.length
    k = :y

    while k == :y do

      print 'scan to detect new IP addresses? (y/n) '
      k = gets.lstrip.chomp.to_sym
      (puts 'enter y or n'; k = :y) if k != :y and k != :n
      
      return if k == :n
      
      a2 = scan ip_base
      found = a2 - a1
      
      if a2 == a1 then
        puts 'no new IP addresses found'
      else
        if found.any? then
          puts 'found : ' + found.inspect 
        else
          puts "found %d IP addresses" % a1.length
        end
      end
      
      a1 = a2

    end

    
  end
  
  def self.local_ip()
    Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }
  end
  
  def self.scan(ip_base=nil, range=1..254, t=1)
    
    ip_base = local_ip.ip_address[/\d+\.\d+\.\d+\./] unless ip_base    
    
    a = []
    (range).map{|i| Thread.new {a << i if pingecho(ip_base+i.to_s, t) }}.join
    sleep t + 0.25
    
    a.sort.map{|x| ip_base + x.to_s}
  end
      
  def self.pingecho(host, timeout=5, service="echo")
    begin
      Timeout.timeout(timeout) do
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