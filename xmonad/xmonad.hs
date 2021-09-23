{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses #-}
import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
--import XMonad.Hooks.SetWMName
--import XMonad.Layout
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import qualified Data.Map as M
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
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

myGmailApp="mail.google.com"
myWhatsappApp="web.whatsapp.com"
myLinkedInApp="www.linkedin.com"
myTelegramApp="web.telegram.org"
myExtraWorkspaces=[(xK_0, "10"),(xK_F1, "11"),(xK_F2, "12"),(xK_F3,"13"),(xK_F4,"14"),(xK_F5,"15"),(xK_F6,"16"),(xK_F7,"17"),(xK_F8,"18"),(xK_F9,"19"),(xK_F10,"20"),(xK_F11,"21"),(xK_F12,"22"),(xK_Print,"23"),(xK_Scroll_Lock,"24"),(xK_Pause,"25")]
myWorkspaces =["1","2","3","4","5","6","7","8","9"] ++ (map snd myExtraWorkspaces)

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
	normalBorderColor = "#0f141f" ,
	terminal = "gnome-terminal",
	borderWidth = 1,
	focusFollowsMouse  = myFocusFollowsMouse,
	startupHook = startupHook xfceConfig >> setWMName "LG3D",
	manageHook = composeAll [
	--		className =? "vlc" --> doFloat,
	--		className =? "smplayer" --> doFloat,
		className =? "Wrapper-2.0" -->doFloat,
		resource  =? "desktop_window" --> doIgnore,
		appName =? myGmailApp --> doShift "1",  
		appName =? myWhatsappApp --> doShift "2",  
		appName =? myLinkedInApp --> doShift "3",  
		appName =? myTelegramApp --> doShift "4",  
		isFullscreen --> doFullFloat,
		manageHook xfceConfig
  		],
	workspaces = myWorkspaces,
	layoutHook =  smartBorders (avoidStruts ( mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) 
		resizeLayout ||| Mirror resizeLayout |||  Full ) |||  Full ) --, ||| layoutHook xfceConfig
	} `additionalKeys` myKeys
--  layoutHook =  smartBorders (avoidStruts ( mkToggle (single REFLECTX) $ mkToggle (single REFLECTY)
--                resizeLayout ||| Mirror resizeLayout |||  Full ) |||  Full )--, ||| layoutHook xfceConfig
myKeys=	[
	]
	  ++
    	[
	 ((modMaskKey .|. shiftMask, xK_s) , spawn "xfce4-screenshooter" )
	,  ((modMaskKey .|. shiftMask, xK_u) , spawn "systemctl suspend" )
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
	++ [
        ((modMaskKey, key), (windows $ W.greedyView ws))
        | (key,ws) <- myExtraWorkspaces
      ] ++ [
        ((modMaskKey .|. shiftMask, key), (windows $ W.shift ws))
        | (key,ws) <- myExtraWorkspaces
      ]

