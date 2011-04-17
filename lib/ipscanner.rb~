#!/usr/bin/env ruby

# file: ipscanner.rb

require 'net/ping'

class IPScanner

  def self.run(ip_base='192.168.1.')
    a = []
    (1..254).each{|i| Thread.new {ip = ip_base + i.to_s; a << i if Net::Ping::TCP.new(ip, 'http').ping?}}
    a.sort.map{|x| ip_base + x.to_s}
  end

  def self.scan(ip_base='192.168.1.') self.run  end
end
