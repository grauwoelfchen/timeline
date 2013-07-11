#!/usr/bin/env ruby

require 'drb'

user,action,target,name,rev,repo,date = ARGV

MyDrip = DRbObject.new_with_uri("druby://localhost:54321")
MyDrip.write([action, target, name, rev, repo, date], user)
