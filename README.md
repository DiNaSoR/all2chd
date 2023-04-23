# all2chd

This script converts CUE, GDI, ISO, and ZIP files containing disc images to CHD format using `chdman.exe`.

## Usage

1. Place the `chdman.exe` file (from MAME) in the same folder as the `all2chd.bat` script.
2. Put the disc images you want to convert (CUE, GDI, ISO, or ZIP files) in the same folder as the script.
3. Run the `all2chd.bat` script by double-clicking it.
4. The script will convert the disc images to CHD format and save the CHD files in the same folder.
5. If a disc image is in a ZIP file, the script will extract it, convert the image, and then delete the extracted folder and the original ZIP file.

## Requirements

- Windows operating system
- `chdman.exe` from MAME
- 7-Zip installed on your system and available in the PATH
