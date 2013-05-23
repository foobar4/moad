moad
====

M.O.A.D  v0.8

This web-app is more like a small collection of scripts that takes a 
preformatted Google Spreadsheet and creates a Graphviz diagram from it.

Originally made because I got fed-up with having to do everything from the command line 
and I needed my colleagues to create their own diagrams. MS Visio is nice, but when you have
a long telephone routing list for example, you need a bit more power.

http://graphviz.org has been one of my favourite diagramming tools for years and
although there are many GUI tools, none really fitted for what I needed todo.

Also, please note that the code... well it needs work. I am primarily a Sysadmin and 
a bit new to PHP etc. Then also, some of the coding was just done the lazy-sysadmin style - quick and dirty.

Subject to GPL v3.0

Requirements:
------------

* Linux (tested on Ubuntu 10.04LTS) using bash shell
* Apache / nginx with PHP
* Graphviz installed
* Google Drive account
* Formatted Google Drive spreadsheet with ONLY ONE table

Todo:
----

* Impliment CSS
* Incorporate the bash script commands directly into PHP
* Get a better logo
* Cleanup the sed filtering
