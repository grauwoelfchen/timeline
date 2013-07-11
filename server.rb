#!/usr/bin/env ruby

require 'drip'
require 'drb'

class Drip
  def quit
    Thread.new do
      synchronize do |key|
        exit(0)
      end
    end
  end
end

drip = Drip.new(File.join(ENV['HOME'], ".drb"))
DRb.start_service("druby://localhost:54321", drip)
DRb.thread.join
