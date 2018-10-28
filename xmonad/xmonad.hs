{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses #-}
import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
--import XMonad.Layout
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import qualified Data.Map as M
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import Control.Arrow ((***), second)
import XMonad.Layout.ResizableTile --(MirrorShrink, MirrorExpand)
--import XMonad.Layout.ResizableTile( MirrorResize( MirrorShrink ) )

import XMonad.Hooks.ManageDocks
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import XMonad.Util.Run
--import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

modMaskKey = mod4Mask
newtype Flip l a = Flip (l a) deriving (Show, Read)
instance LayoutClass l a => LayoutClass (Flip l) a where
    runLayout (W.Workspace i (Flip l) ms) r = (map (second flipRect) *** fmap Flip)
                                                `fmap` runLayout (W.Workspace i l ms) (flipRect r)
                                         where screenWidth = fromIntegral $ rect_width r
                                               flipRect (Rectangle rx ry rw rh) = Rectangle (screenWidth - rx - (fromIntegral rw)) ry rw rh
    handleMessage (Flip l) = fmap (fmap Flip) . handleMessage l
    description (Flip l) = "Flip "++ description l

myGmailApp="crx_kmhopmchchfpfdcdjodmpfaaphdclmlj"
myWhatsappApp="crx_hnpfjngllnobngcgfapefoaidbinmjnm"
myLinkedInApp="crx_ohghonlafcimfigiajnmhdklcbjlbfda"
myTelegramApp="crx_hadgilakbfohcfcgfbioeeehgpkopaga"

myWorkspaces =["1:mail","2:buss","3:browser","4","5","6","7","8","9"]  

-- tiledLayout = Tall nmaster delta ratio
--  where
--    nmaster = 1      -- The default number of windows in the master pane.
--    ratio   = 1/2    -- Default proportion of screen occupied by master pane.
--    delta   = 1/100  -- Percent of screen to increment by when resizing panes.
--tiled180=Flip tiledLayout

resizeLayout =  ResizableTall 1 (1/100) (1/2) [] 
--resizeLayout2 = ResizableTall 2 (1/100) 1 [] 

main = xmonad $ xfceConfig
	{
	modMask = modMaskKey,
	focusedBorderColor = "#9f343f" ,
	normalBorderColor = "#2f343f" ,
	terminal = "gnome-terminal",
	borderWidth = 1,
	focusFollowsMouse  = myFocusFollowsMouse,
	manageHook = composeAll [
	--		className =? "vlc" --> doFloat,
	--		className =? "smplayer" --> doFloat,
		className =? "Wrapper-2.0" -->doFloat,
		resource  =? "desktop_window" --> doIgnore,
		appName =? myGmailApp --> doShift "1:mail",  
		appName =? myWhatsappApp --> doShift "1:mail",  
		appName =? myLinkedInApp --> doShift "2:buss",  
		appName =? myTelegramApp --> doShift "2:buss",  
		className =? "Google-chrome" --> doShift "3:browser",
		className =? "insync.py" --> doFloat,
		isFullscreen --> doFullFloat,
		manageHook xfceConfig
  		],
	workspaces = myWorkspaces,
	layoutHook =  smartBorders (avoidStruts ( mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) 
		resizeLayout ||| Mirror resizeLayout |||  Full ) |||  Full )--, ||| layoutHook xfceConfig
	} `additionalKeys` myKeys

myKeys=	[
	]
	  ++
    	[
	  ((modMaskKey .|. shiftMask, xK_u) , spawn "systemctl suspend" )
	, ((modMaskKey .|. shiftMask, xK_x) , sendMessage $ Toggle REFLECTX )
	, ((modMaskKey .|. shiftMask, xK_y) , sendMessage $ Toggle REFLECTY )
--	, ((modMaskKey, xK_Left),  sendMessage MirrorExpand)
	, ((modMaskKey, xK_Up),    sendMessage MirrorExpand)
--	, ((modMaskKey, xK_Right), sendMessage MirrorShrink)
	, ((modMaskKey, xK_Down),  sendMessage MirrorShrink)
	, ((modMaskKey .|. shiftMask, xK_Down),  shiftToNext)
	, ((modMaskKey .|. shiftMask, xK_Up),    shiftToPrev)
	, ((modMaskKey, xK_Right),   nextWS)
	, ((modMaskKey, xK_Left),    prevWS)
	, ((modMaskKey, xK_z), toggleWS)
	]

