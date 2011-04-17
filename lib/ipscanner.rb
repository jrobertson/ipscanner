#!/usr/bin/env ruby

# file: ipscanner.rb

require 'net/ping'

class IPScanner

  def initialize(ip_base='192.168.1.')
    @ip_base = ip_base
    @a = []
    threads = (1..254).map{|i| Thread.new {ip = ip_base + i.to_s; @a << i if Net::Ping::TCP.new(ip, 'http').ping?}}
    threads.join
  end
  
  def self.run(ip_base='192.168.1.')
    a = []
    threads = (1..254).map{|i| Thread.new {ip = ip_base + i.to_s; a << i if Net::Ping::TCP.new(ip, 'http').ping?}}
    threads.join
    a.sort.map{|x| ip_base + x.to_s}
  end

  def self.scan(ip_base='192.168.1.') self.run  end
    
  def to_a()
    @a.sort.map{|x| @ip_base + x.to_s}        
  end
end
