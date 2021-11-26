{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses, RecordWildCards #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE PatternGuards #-}
import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import qualified Data.Map as M
import XMonad.Util.EZConfig (additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import Control.Arrow ((***), second)
import XMonad.Layout.ResizableTile --(MirrorShrink, MirrorExpand)

import XMonad.Hooks.ManageDocks
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Layout.IndependentScreens
import Control.Applicative
import Data.Monoid
import XMonad.Util.WorkspaceCompare

import qualified XMonad.Util.ExtensibleState as XS
import Control.Concurrent

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

myWorkspaces = withScreens 2 ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
resizeLayout =  ResizableTall 1 (1/100) (1/2) [] 


myEwmhDesktopsEventHook :: Event -> X All 
myEwmhDesktopsEventHook e@(ClientMessageEvent
    {ev_window = w, ev_message_type = mt, ev_data = d}) = do
    a_aw <- getAtom "_NET_CURRENT_DESKTOP"
    if mt == a_aw
       then do
          let n = fromIntegral (head d)
          if n == 0 
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+1'"
                pure (All True)
          else if n== 1
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+2'"
                pure (All True)
          else if n== 2
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+3'"
                pure (All True)
          else if n== 3
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+4'"
                pure (All True)
          else if n== 4
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+5'"
                pure (All True)
          else if n== 5
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+6'"
                pure (All True)
          else if n== 6
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+7'"
                pure (All True)
          else if n== 7
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+8'"
                pure (All True)
          else if n== 8
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+9'"
                pure (All True)
          else if n== 9
             then do
                spawn "xdotool key 'Super_L+w' && xdotool key 'Super_L+0'"
                pure (All True)
          else if n== 10
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+1'"
                pure (All True)
          else if n== 11
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+2'"
                pure (All True)
          else if n== 12
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+3'"
                pure (All True)
          else if n== 13
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+4'"
                pure (All True)
          else if n== 14
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+5'"
                pure (All True)
          else if n== 15
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+6'"
                pure (All True)
          else if n== 16
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+7'"
                pure (All True)
          else if n== 17
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+8'"
                pure (All True)
          else if n== 18
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+9'"
                pure (All True)
          else if n== 19
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+0'"
                pure (All True)
          else if n== 7
             then do
                spawn "xdotool key 'Super_L+e' && xdotool key 'Super_L+1'"
                pure (All True)
             else ewmhDesktopsEventHook e
       else ewmhDesktopsEventHook e
myEwmhDesktopsEventHook e = ewmhDesktopsEventHook e

--myEwmhDesktopsEventHook :: Event -> X All 
--myEwmhDesktopsEventHook e@(ClientMessageEvent
--    {ev_window = w, ev_message_type = mt, ev_data = d}) = withWindowSet $ \s -> do
--    sort' <- getSortByIndex
 --   let ws = sort' $ W.workspaces s
 --   a_aw <- getAtom "_NET_CURRENT_DESKTOP"
 --   if mt == a_aw
 --      then 
  --        do
  --        let n = fromIntegral (head d)
  --        if 0 <= n && n < length ws then
 --            if n>9 then spawn "xdotool key 'Super_L+e'"
  --           else spawn "xdotool key 'Super_L+w'"
 --         else ewmhDesktopsEventHook e
--       else ewmhDesktopsEventHook e
--myEwmhDesktopsEventHook e = ewmhDesktopsEventHook e



--myEwmhDesktopsEventHook :: Event -> X All
--myEwmhDesktopsEventHook e@ClientMessageEvent{
--               ev_window = w,
--               ev_message_type = mt,
--               ev_data = d
--       } = withWindowSet $ \s -> do
--       sort' <- getSortByIndex
--       let ws = sort' $ W.workspaces s

--       a_cd <- getAtom "_NET_CURRENT_DESKTOP"
--       a_d <- getAtom "_NET_WM_DESKTOP"
--       a_aw <- getAtom "_NET_ACTIVE_WINDOW"
--       a_cw <- getAtom "_NET_CLOSE_WINDOW"
--       if  mt == a_cd then do
--               let n = fromIntegral (head d)
--               if 0 <= n && n < length ws then
--                       windows $ W.view (W.tag (ws !! n))
--                 else  trace $ "Bad _NET_CURRENT_DESKTOP with data[0]="++show n
--        else if mt == a_d then do
--               let n = fromIntegral (head d)
--               if 0 <= n && n < length ws then
--                       windows $ W.shiftWin (W.tag (ws !! n)) w
--                 else  trace $ "Bad _NET_DESKTOP with data[0]="++show n
--        else if mt == a_aw then do
--               windows $ W.focusWindow w
--        else if mt == a_cw then do
--               windows $ W.focusWindow w
--               kill
--        else trace $ "Unknown ClientMessageEvent " ++ show mt
--handle _ = undefined -- does not happen, as otherwise ewmhDesktopsHook would not match


--myEwmhDesktopsEventHook :: Event -> X All
--myEwmhDesktopsEventHook e@ClientMessageEvent{
--               ev_window = w,
--               ev_message_type = mt,
--               ev_data = d
--       } = withWindowSet $ \s -> do
--       sort' <- getSortByIndex
--       let ws = sort' $ W.workspaces s

--    a_aw <- getAtom "_NET_CURRENT_DESKTOP"
    --_NET_ACTIVE_WINDOW"
--    spawn "echo " ++ ev_message_type ++ " 3>~
--    if ev_message_type == a_aw
--      then
--          do
--              let n = fromIntegral (head d)
--              if 0 <= n && n < length ws then
--                 windows $ W.view (W.tag (ws !! n))
--                 else  trace $ "Bad _NET_CURRENT_DESKTOP with data[0]="++show n
--              spawn "echo here >>~/1"
 --             pure (All True)
--      else do
--              ewmhDesktopsEventHook e
--myEwmhDesktopsEventHook e = ewmhDesktopsEventHook e


conf = xfceConfig
	{
	modMask = modMaskKey,
	focusedBorderColor = "#9f343f" ,
	normalBorderColor = "#0f141f" ,
	terminal = "gnome-terminal",
	borderWidth = 1,
	focusFollowsMouse  = myFocusFollowsMouse,
	startupHook = startupHook xfceConfig >> setWMName "LG3D",
        handleEventHook = myEwmhDesktopsEventHook,
	manageHook = composeAll [
		className =? "Wrapper-2.0" -->doFloat,
		resource  =? "desktop_window" --> doIgnore,
		isFullscreen --> doFullFloat,
		manageHook xfceConfig
  		],
	workspaces = myWorkspaces,
	layoutHook =  smartBorders (avoidStruts ( mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) 
		resizeLayout ||| Mirror resizeLayout |||  Full ) |||  Full ) 
	} `additionalKeys` myKeys
myKeys=	[
	]
	  ++
    	[
	  ((modMaskKey .|. shiftMask, xK_s) , spawn "xfce4-screenshooter" )
	, ((modMaskKey .|. shiftMask, xK_u) , spawn "systemctl suspend" )
	, ((modMaskKey .|. shiftMask, xK_x) , sendMessage $ Toggle REFLECTX )
	, ((modMaskKey .|. shiftMask, xK_y) , sendMessage $ Toggle REFLECTY )
	, ((modMaskKey, xK_Up),    sendMessage MirrorExpand)
	, ((modMaskKey, xK_Down),  sendMessage MirrorShrink)
	, ((modMaskKey .|. shiftMask, xK_Down),  shiftToNext)
	, ((modMaskKey .|. shiftMask, xK_Up),    shiftToPrev)
	, ((modMaskKey, xK_Right),   nextWS)
	, ((modMaskKey, xK_Left),    prevWS)
	, ((modMaskKey, xK_z), toggleWS)
	] ++ [
         -- workspaces are distinct by screen
          ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
               | (i, k) <- zip (workspaces' conf) ([xK_1 .. xK_9] ++ [xK_0])
               , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
        ] ++ [
         -- swap screen order
         ((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) | (key, sc) <- zip [xK_w, xK_e, xK_r] [0,1,2] , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = xmonad $ conf
