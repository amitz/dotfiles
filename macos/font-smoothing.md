# Better Font Support

Mac has a bad support for Monitors which are not "Mac" monitors. Fonts looks very
fuzzy (especially red font). There's to way to somehow improve it, but not
completely solve it. This has been testing with M1 Silicon Macbook Pro, and "MSI
Optix MAG274QRF-QD".

## Disable Font Smoothing

This can be done by using:
defaults -currentHost write -g AppleFontSmoothing -int 0

It's possible to experiment with 1, 2, or 3 as values (those are different levels
of font smoothing). To revert back to the default:

defaults -currentHost delete -g AppleFontSmoothing

## Force sRGB

Something times macOS will inproperly set the Monitor not to use Ybcr instead of
RGB. You can fix it on "Montery" by forcing 8 Bit (RGB) instead of Ybcr (10 Bit):
this script:

1. Connect only the problem display.

2. Backup any of `com.apply.windowserver.display.plist` file in the following
   directories, then delete them all:

    ```shell
    /Library/Preferences
    ~/Library/Preferences
    ~/Library/Preferences/ByHost
    ```

3. Reset the machine. `com.apply.windowserver.display.plist` should get recreated
   int `/Library/Preferences`. Also - Go to you Monitor settings, turn HDR on and
   off, and this change will trigger the creation of another
   `com.apply.windows.server.display.[*].plist` file in your
   `~/Library/Preference/Byhost`.

4. You have to modify both exactly the same. Start by turning the plist binary
   into xml by:

    ```shell
    sudo plutil -convert xml1 <file>
    ```

5.  Then tweak the following:

    ```
    <key>LinkDescription</key>
    <dict>
    <key>BitDepth</key>
    <integer>8</integer>
    <key>EOTF</key>
    <integer>0</integer>
    <key>PixelEncoding</key>
    <integer>0</integer>
    <key>Range</key>
    <integer>1</integer>
    ```

6. Turn the file again into binary:

    ```shell
    sudo plutil -convert binary1 <file>
    ```

7. Remember to do the above for the two files! Reboot and re-plug the monitor.

8. You should now work on RGB. You can test it by going into the Monitor
   Information in the OCD, and check Bitrate is 8 and not 10!
