# Timeline

Timeline server/client scripts for Git branch and tag.


## Usage


### hook

* run server.rb with daemontools
* put update hook and client.rb to hooks directories


### push


```
% git push origin master
Total 0 (delta 0), reused 0 (delta 0)
  remote: [DEBUG] yasuhiro
  remote: [DEBUG] update
  remote: [DEBUG] branch
  remote: [DEBUG] 07ee9d5cd19f6e3eb5761eb48b2fd1331895ca6c
  remote: [DEBUG] commit
  remote: [DEBUG] master
  remote: [DEBUG] Fri Jul 12 04:24:22 JST 2013
  remote: [DEBUG] hooks
  remote: [DEBUG] timeline.git
  To git@grauwoelfchen.net:yasuhiro/timeline.git
```


### read timeline

Tracked timeline :-D

```
% pry # or irb
[1] pry(main)> require "drb"
=> true
[2] pry(main)> MyDrip = DRbObject.new_with_uri("druby://localhost:54321")
=> #<DRb::DRbObject:0x00000002f21be0 @ref=nil, @uri="druby://localhost:54321">
[3] pry(main)> MyDrip.head
=> [[1373570662697396,
  ["update",
   "branch",
   "master",
   "07ee9d5cd19f6e3eb5761eb48b2fd1331895ca6c",
   "timeline.git",
   "Fri Jul 12 04:24:22 JST 2013"],
  "yasuhiro"]]
[4] pry(main)> k,_ = MyDrip.read(0, 3).last
=> [1373569972095277,
 ["update",
  "branch",
  "master",
  "ecd0afee973ce623b873e0a31b6988d69d50bcb9",
  "timeline.git",
  "Fri Jul 12 04:12:52 JST 2013"],
 "yasuhiro"]
[5] pry(main)> MyDrip.read(k, 3)
=> [[1373570319317236,
  ["create",
   "branch",
   "create-client-script",
   "9f28c45b0f23bd4b034794989c58804e5b2b1c6b",
   "timeline.git",
   "Fri Jul 12 04:18:39 JST 2013"],
  "yasuhiro"],
 [1373570348319967,
  ["update",
   "branch",
   "master",
   "9f28c45b0f23bd4b034794989c58804e5b2b1c6b",
   "timeline.git",
   "Fri Jul 12 04:19:08 JST 2013"],
  "yasuhiro"],
 [1373570657317826,
  ["create",
   "branch",
   "add-hooks",
   "07ee9d5cd19f6e3eb5761eb48b2fd1331895ca6c",
   "timeline.git",
   "Fri Jul 12 04:24:17 JST 2013"],
  "yasuhiro"]]
```
