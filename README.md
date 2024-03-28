#  SMAP - Swiss Topo Map URL Generator
Command Line Tool to show image location on a SwissTopo Map.


## Installation
Download source code, compile and run it with the Swift compiler:
```
curl -LJO https://github.com/Fahrenberg/smap/archive/refs/tags/1.1.0.zip
unzip smap-1.1.0.zip
cd smap-1.1.0
swift run smap Sources/lochberg.jpg
```

## Usage:

smap [-o <o>] [--browser] <image-file-path>

ARGUMENTS:
  <image-file-path>       Image file path

OPTIONS:
  -o <o>                  Create Map-URL for: swiss = Swiss Topo, osm = Open Street Map, placeholder = Placeholder Image
  -b, --browser           Open Map-URL in Browser
  -h, --help              Show help information.



Reads file from \<image-file-path\>
and extracts GPS coordinates.
Returns either URL string for the selected map typo 
or opens the location in the default browser

Flag -b indicates open in current browser.
Default is printing URL for Swiss Topo (-o=swiss).

URL can be piped and is "" enclosed.

## Example for macOS Terminal with lochberg.jpg:
File [lochberg.jpg](https://github.com/Fahrenberg/smap/blob/43b726b9bc03bd5a3a54cf273c78af39ebc07f2c/Sources/lochberg.jpg) 

Terminal:
``` 
smap lochberg.jpg
```
Result:
```
"https://map.geo.admin.ch/?swisssearch=46.623938333333335,8.469063333333333"
```

Opens file `lochberg.jpg` in the default browser (e.g. Safari):
```
smap lochberg.jpg | xargs open
```
  or 
  
```
smap -b lochberg.jpg
```

##
(c) Jean-Nicolas Fahrenberg

[www.fahrenberg.app](https://www.fahrenberg.app)
