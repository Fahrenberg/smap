#  SMAP - Swiss Topo Map URL Generator
Command Line Tool to show image location on a SwissTopo Map.


## Installation
Download source code from Github, compile and run it with the Swift compiler:
```shell

git clone https://github.com/Fahrenberg/smap.git
cd smap
swift run smap Sources/lochberg.jpg

```

## Usage:

smap [-o \<output\>] [-b] \<image-file-path\>

ARGUMENTS:
  \<image-file-path\>

OPTIONS:

  -o \<output\> type of map URL for \<output\> :
  <br> swiss | s = Swiss Topo
  <br> osm | o = Open Street Map
  <br> placeholder | p = Placeholder Image

  -b, --browser Open Map-URL in Browser

  -h, --help Show help information.

---

Reads file from \<image-file-path\>
and extracts GPS coordinates.<br>
Returns either URL string for the selected map type 
or opens the location in the default browser.<br>
<br>
Default is printing URL for Swiss Topo (-o=swiss).

URL can be piped and will be "" enclosed.

---

## Example for macOS Terminal with lochberg.jpg:
File [lochberg.jpg](https://github.com/Fahrenberg/smap/blob/43b726b9bc03bd5a3a54cf273c78af39ebc07f2c/Sources/lochberg.jpg) 

Terminal:
```shell
smap lochberg.jpg
```
Result:
```
"https://map.geo.admin.ch/?swisssearch=46.623938333333335,8.469063333333333"
```

Opens file `lochberg.jpg` in the default browser (e.g. Safari):
```shell
smap lochberg.jpg | xargs open
```
  or 
  
```shell
smap -b lochberg.jpg
```

##
(c) Jean-Nicolas Fahrenberg

[www.fahrenberg.app](https://www.fahrenberg.app)
