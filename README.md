# XFmonad

I have compiled some useful features of three desktop environments into one desktop environment. The global menu which is effectively applied in the MacOS, the idea of left dock of Ubuntu, the lightweight-ness of XFCE, and the productive-ness of Xmonad, one of the tiling window managers. 

I made a script that automatically turns Ubuntu based Xfce desktop to my configuration. I recommend trying this on a <a href="https://www.linuxliteos.com/">Linux Lite</a> installation. Alternatively, you could try installing it on an Ubuntu box with Xfce installed, or on Xubuntu. Feedbacks are all welcome about other distributions.
Xmonad is configured using xmonad.hs in ~/.xmonad. According to the configuration, the mod key is set as Win/Cmd key. 
The keyboard shortcuts are as follows:
<br><br>
<table>
<tr><td width=300><b>Shortcut</b></td><td><b>Task</b></td></tr>
<tr><td>Shift + Mod + c </td><td>Close the active window</td></tr>
<tr><td>Shift + Mod + s </td><td>Take xfce4-screenshot</td></tr>
<tr><td>Shift + Mod + x </td><td>Reverse tiling windows according to <i>x</i>-axis</td></tr>
<tr><td>Shift + Mod + y </td><td>Reverse tiling windows according to <i>y</i>-axis</td></tr>
<tr><td>Shift + Mod + h </td><td>Increase the width of left pane</td></tr>
<tr><td>Shift + Mod + l </td><td>Increase the width of right pane</td></tr>
<tr><td>Mod + Up </td><td>Increase the height of windows in the right pane</td></tr>
<tr><td>Mod + Down </td><td>Decrease the width of windows in the right pane</td></tr>
<tr><td>Mod + Space </td><td>Switch to another tiling setup</td></tr>
<tr><td>Mod + Tab </td><td>Switch to next window in the workspace</td></tr>
<tr><td>Mod + z </td><td>Switch to the previous workspace</td></tr>
<tr><td>Mod + (1|2|3|4|5|6|7|8|9) </td><td>Switch to the workspace indicated by the number</td></tr>
<tr><td>Shift + Mod + (1|2|3|4|5|6|7|8|9) </td><td>Move the active window to the workspace indicated by the number</td></tr>
</table>
<br><br>
The ordering of the tiling setups are as follows:
<ol>
<li>Master window on left, others on right</li>
<li>Master window on top, other at bottom</li>
<li>Only master window in full screen with left and top panels</li>
<li>Only master window in full screen (useful for watching full screen video)</li>
</ol>
If there are multiple windows in a workspace, the active window will have a red border.
The script will install the packages below using apt:
<br>
xmonad, xfce4-dockbarx-plugin, gnome-terminal, zeitgeist, python-xdg, vala-panel-appmenu, appmenu-gtk3-module, appmenu-gtk2-module, appmenu-qt, gnome-terminal, xmonad, shutter, xfce4-appmenu-plugin, xfce4-systemload-plugin, arc-theme
<br><br>
Please note that, the script will install google-chrome amd64 binary. If you have other hardware, you should modify the related line. The script will install Arc Dark theme and switch to it.
<br>
<br>
After running the script, you will have a desktop environment that looks like the following screenshots:<br><br>
<p>You can preview media easily utilizing the tiling window manager:<br>

<a href="https://1.bp.blogspot.com/-eWtO-XZ9sgw/W9Ync3PfEyI/AAAAAAAAQ1Y/djnl88a64QcDYQ-lHrGRUE3yQ19xkcXewCPcBGAYYCw/s1600/pic5.png" imageanchor="1" ><img border="0" src="https://1.bp.blogspot.com/-eWtO-XZ9sgw/W9Ync3PfEyI/AAAAAAAAQ1Y/djnl88a64QcDYQ-lHrGRUE3yQ19xkcXewCPcBGAYYCw/s640/pic5.png" width="640" height="360" data-original-width="1600" data-original-height="900" /></a><br><br></p>

<p>You can prepare your own IDE like environment. For example, the picture shows preview of a pdf paper at the right side, and tex file editor at the left. At the bottom of the left side, a command line is present to compile the tex file into pdf. The pdf viewer at the right side immediately previews if a new compilation occurs. <br><a href="https://4.bp.blogspot.com/-j4OQfj-kjes/W9Xgc6riLTI/AAAAAAAAQ1E/q5Mq8ZLulvIDJOuYkIzo0Y54OzdmfABJwCPcBGAYYCw/s1600/pic2.png" imageanchor="1" ><img border="0" src="https://4.bp.blogspot.com/-j4OQfj-kjes/W9Xgc6riLTI/AAAAAAAAQ1E/q5Mq8ZLulvIDJOuYkIzo0Y54OzdmfABJwCPcBGAYYCw/s640/pic2.png" width="640" height="400" data-original-width="1280" data-original-height="800" /></a>
<br><br></p>
<p>The following pictures show Chrome in full screen. The first picture demonstrates the top global menu. The second picture demonstrates the left dock. <br><br><a href="https://1.bp.blogspot.com/-iaBX6BadCn4/W9XgarYzODI/AAAAAAAAQ04/Kx1wL3-SPSEzHL_MeZoMUxcHhv9M0A6BgCPcBGAYYCw/s1600/pic3.png" imageanchor="1" ><img border="0" src="https://1.bp.blogspot.com/-iaBX6BadCn4/W9XgarYzODI/AAAAAAAAQ04/Kx1wL3-SPSEzHL_MeZoMUxcHhv9M0A6BgCPcBGAYYCw/s640/pic3.png" width="640" height="400" data-original-width="1280" data-original-height="800" /></a><br><br></p>

<p><a href="https://2.bp.blogspot.com/-NIOc9W7e_ZM/W9XgbZ4PNOI/AAAAAAAAQ08/zv9V1cZ-U7EBYrLFwkijGoxgQwOqY7FoACPcBGAYYCw/s1600/pic4.png" imageanchor="1" ><img border="0" src="https://2.bp.blogspot.com/-NIOc9W7e_ZM/W9XgbZ4PNOI/AAAAAAAAQ08/zv9V1cZ-U7EBYrLFwkijGoxgQwOqY7FoACPcBGAYYCw/s640/pic4.png" width="640" height="400" data-original-width="1280" data-original-height="800" /></a></p>

