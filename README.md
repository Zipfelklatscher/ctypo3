## Description
**ctypo3** is a bash script to cleanup the TYPO3 CMS (temp,cache and logs) project files and mysql data. I has been tested with TYPO3 version 4.5.x and 6.x.


## Installation for global access on server

Move the folder in:

```console
/usr/local/bin
```

Set SCRIPT_PATH in cTypo3.sh:

```console
SCRIPT_PATH="/usr/local/bin/ctypo3-master"
```

Create a symbolic link:


```console
ln -s /usr/local/bin/ctypo3_script/cTypo3.sh /usr/local/bin/ctypo3
```

## Usage

Start the script width sudo:

```console
sudo ctypo3 /path/to/your/typo3/project/folder
```

Make your choice (Sample 4.5.x menu):

```console
What do you wanna do?
[1] Clear mysql cache tabels
[2] Clear sys_log & sys_history table
[3] Clear typo3conf temp files
[4] Clear temp images
[5] Clear typo3temp temp files
[6] Clear session data
[7] Clear all
[8] Print extensions
[9] Exit
Please choose:
```

License
-------

Copyright (c) 2013 Jaap Dierking

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
