#  SMAP - Swiss Topo Map URL Generator
Command Line Tool to show image location on a SwissTopo Map.


## Installation
Use Swift Package Manager:


## Usage:

smap [-b]  \<image-file-path\>

Reads file from \<image-file-path\>
and extracts GPS coordinates.
Returns either URL string to open a Swiss Topo Map
or opens the URL in the current browser.

Flag -b indicates open in current browser.
Default is printing URL.

URL can be piped and is "" enclosed.

## Example for macOS Terminal:

```terminal
smap "https://map.geo.admin.ch/?swisssearch=46.623938333333335,8.469063333333333" | xargs openˋ
```
  or 
  
```terminal
  smap -b "https://map.geo.admin.ch/?swisssearch=46.623938333333335,8.469063333333333" 
```

##
(c) Jean-Nicolas Fahrenberg

www.fahrenberg.app
