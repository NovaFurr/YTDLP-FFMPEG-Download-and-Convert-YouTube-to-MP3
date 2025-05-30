
# YT-DLP Download and convert to MP3 using FFMPEG in Bash script

A simple bash script for downloading and converting to MP3 using FFMPEG and YT-DLP

# How to use: 
Call the script with 1 argument, the youtube video that you want to dowload:
example:
 ```./downloadandconvert.sh https://www.youtube.com/watch\?v\=dQw4w9WgXcQ```

# Packages needed:

## Gentoo

```sudo emerge --ask net-misc/yt-dlp && emerge --ask media-video/ffmpeg```

## Arch, Manjaro, EndevourOS
```sudo pacman -S ffmpeg yt-dlp```




## Fedora, and it's spins

 ```sudo dnf install ffmpeg yt-dlp```


## Debian
```sudo apt install ffmpeg yt-dlp ```

## Other Distros
I am unfortunately unable to provide information on other distros, please search up ```ffmpeg``` and ```yt-dlp``` using your package manager  


### Legal:
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org/>
