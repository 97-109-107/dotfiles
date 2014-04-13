{-# LANGUAGE NoMonomorphismRestriction #-}
import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Actions.PhysicalScreens
import XMonad.Layout.WindowNavigation
import XMonad.Hooks.ICCCMFocus
-- import XMonad.Util.Scratchpad
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.StackTile
import qualified XMonad.Layout.ToggleLayouts as Tog
import XMonad.Layout.Maximize
import XMonad.Layout.Dishes
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Operations
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO
import XMonad.Layout.Combo
import XMonad.Layout.Spiral
import XMonad.Layout.Accordion
import XMonad.Layout.Tabbed
import XMonad.Layout.Roledex
import XMonad.Layout.ResizableTile
import XMonad.Util.Themes
import XMonad.Actions.SwapWorkspaces
import XMonad.Layout.Grid
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Layout.TabBarDecoration
import XMonad.Layout.MultiToggle as Multi
import XMonad.Layout.Reflect
import XMonad.Layout.TwoPane
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.DynamicWorkspaces
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Spiral
import XMonad.Layout.Circle
import XMonad.Layout.Spacing
import XMonad.Layout.Magnifier as Mag
import XMonad.Layout.ThreeColumns
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.DragPane
import XMonad.Hooks.FadeInactive        
import XMonad.Layout.Cross
import qualified XMonad.StackSet as W
--xprop | grep WM_CLASS 
-- import XMonad.Actions.Volume
xK_XF86AudioLowerVolume = 0x1008ff11
xK_XF86AudioRaiseVolume = 0x1008ff13
xK_XF86AudioMute = 0x1008ff12
xK_XF86AudioPlay = 0x1008ff14
--xK_XF86AudioStop
xK_XF86Launch1 = 0x1008ff41
xK_XF86AudioPrev = 0x1008ff16
xK_XF86AudioNext = 0x1008ff17

myBorderWidth = 1
myModMask = mod4Mask
myNumlockMask = mod2Mask
-- myWorkspaces = map show [1..9]++ ["chat","mail"] 
-- myWorkspaces = map show [1..9]
myWorkspaces = ["1","2","3","4","5","6","7","8","9", ""," ","  "]

-- colors
colorFG="#e8e8e8" --mint
colorA="#00E1B3" --mint
colorB="#FFFF9A" --vanilla
colorBCG="#111" --vanilla

myNormalBorderColor = "#222"
myFocusedBorderColor = "#999"
myNormalBg = colorA
myNormalFg = colorB
myFocusedBg = colorA
myFocusedFg = colorB
myFont = "Anonymous Pro-*-*-*-*-*-13-*-*-*-*-*-*-*"

menuCmd = "dmenu_run -i -fn '" ++ myFont ++ "' -nb '" ++ colorBCG ++ "' -nf '" ++ colorFG ++ "' -sb '" ++ colorBCG ++ "' -sf '" ++ colorA ++ "'"

combo = reflectHoriz $ combineTwo (TwoPane 0.03 0.7) (Dishes 1 (2/5)) (Full)
--combo = reflectHoriz $ combineTwo (TwoPane 0.03 0.7) (Mirror (magnifier (Tall 1 (3/100)(3/5)))(Full)
-- combo = reflectHoriz $ combineTwo (TwoPane 0.03 0.7) simpleTabbed (Full)
--combo = combineTwo (TwoPane delta ratio) (Mirror tiled) (Circle)
--nethack = (combineTwo (TwoPane (1/100) (147/227)) (Mirror (ResizableTall 1 (1/100) (3/4) [])) (Dishes 1 (1/6)))
--nethack = (combineTwo (TwoPane (1/100) (2/3)) (simpleCross) (simpleCross))
dishes = StackTile 1 (3/100) (1/2) 
nethack = (combineTwo (TwoPane (1/100) (2/3)) (spacing 20 $ tiled) (spacing 20 $ tiled))
  where 
      tiled = Tall nmaster delta ratio
      nmaster = 1
      delta = 3/100
      ratio = 3/5
      --ratio = toRational (2/(1 + sqrt 5 :: Double)) -- golden ratio

myLayout = avoidStruts( 
           onWorkspaces [""] tiled $
           --onWorkspaces [" "] simpleCross $
           -- onWorkspaces [" "] nethack $
           onWorkspaces [" "] combo $
           onWorkspaces ["  "] dishes $
           -- onWorkspaces ["4"] Circle $
           --onWorkspaces ["2"] golden $
           -- Tog.toggleLayouts Full (smartBorders(maximize(tiled ||| Mirror tiled ||| ThreeColMid 1 (3/100) (1/2) ||| Circle ||| spiral (13/20) )))) 
           Tog.toggleLayouts Full (smartBorders(maximize(tiled ||| golden ||| Mirror tiled ||| ThreeColMid 1 (3/100) (1/2) ||| Circle ||| dishes )))) 
  where 
      tiled = Tall nmaster delta ratio
      nmaster = 1
      delta = 3/100
      ratio = 3/5
      golden = smartBorders(maximize(spiral (toRational (2/(1 + sqrt 5 :: Double)))))

kill8 ss | Just w <- W.peek ss = (W.insertUp w) $ W.delete w ss | otherwise = ss

myManageHook = composeAll
   [ className =? "Rhythmbox" --> doShift "="
   , className =? "Xmessage"  --> doFloat
   , className =? "Specto"  --> doFloat
   , className =? "Zathura"  --> doFloat
   , className =? "Tilda"  --> doFloat
   , className =? "Yakuake"  --> doFloat
   , className =? "Tomate"  --> doFloat
   , className =? "Gnucash"  --> doFloat
   , className =? "Lxrandr"  --> doFloat
   , className =? "Galculator"  --> doFloat
   , className =? "Galculator"  --> doFloat
   , className =? "Calc"  --> doFloat
   , className =? "Pealauncher"  --> doFloat
   , className =? "Transmission-gtk"  --> doFloat
   , className =? "Qalculate-gtk"  --> doFloat 
   , className =? "Wicd-client.py"  --> doFloat
   , className =? "Fatrat"  --> doFloat
   , className =? "com-install4j-runtime-launcher-Launcher"  --> doFloat
   , className =? "Keepassx"  --> doFloat
   , className =? "Xpad"  --> doFloat 
   , className =? "Peazip"  --> doFloat 
   , className =? "processing-app-Base"  --> doFloat
   , className =? "feh"  --> doFloat
   , className =? "Smplayer"  --> doFloat
   , className =? "Zenity"  --> doFloat
   , className =? "Minitube"  --> doFloat
   , className =? "Ssvnc.tcl"  --> doFloat
   , className =? "Clipit"  --> doFloat
   , className =? "Gtk-gnash"  --> doFloat
   , className =? "Xarchiver"  --> doFloat
   , className =? "Kamerka"  --> doFloat
   , className =? "sun-applet-AppletViewer"  --> doFloat
   -- , className =? "Skype"  --> doShift " " 
   , className =? "Skype"  --> doFloat
   , className =? "Disk-manager"  --> doFloat
   , className =? "sun-awt-X11-XFramePeer"  --> doFloat
   , className =? "sun-awt-X11-XDialogPeer"  --> doFloat
   , className =? "Claws-mail"  --> doShift "" 
   , className =? "Sylpheed"  --> doShift "" 
   , title =? "Buddy List"      --> doShift " "
   , title =? "ignore"      --> doFloat
   --, className =? "mailVim"      --> doFloat
   , className =? "mailVim" --> doCenterFloat
   --, className =? "mailVim" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.8)  --x y w h
   , title =? "Select file"      --> doFloat
   , manageDocks
   ]
   -- <+> manageScratchPad

-- manageScratchPad :: ManageHook
-- manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)

  where

    h = 0.1     -- terminal height, 10%
    w = 1       -- terminal width, 100%
    t = 1 - h   -- distance from top edge, 90%
    l = 1 - w   -- distance from left edge, 0%

-- tag of the scratchpad workspace
scratchpadWorkspaceTag :: String
scratchpadWorkspaceTag = "chat"
anamedScratchpadFilterOutWorkspace :: [WindowSpace] -> [WindowSpace]
anamedScratchpadFilterOutWorkspace = filter (\(W.Workspace tag _ _) -> tag /= scratchpadWorkspaceTag)
anamedScratchpadFilterOutWorkspacePP pp = pp {
  ppSort = fmap (. anamedScratchpadFilterOutWorkspace) (ppSort pp)
  }
-- copies?
-- sampleLogHook h = do
--    copies <- wsContainingCopies
--    let check ws | ws `elem` copies = pad . xmobarColor "red" "black" $ ws
--                 | otherwise = pad ws
--    dynamicLogWithPP xmobarPP {ppHidden = check, ppOutput = hPutStrLn h}
--
-- defaultPP = PP { ppCurrent         = wrap "[" "]"
--                , ppVisible         = wrap "<" ">"
--                , ppHidden          = id
--                , ppHiddenNoWindows = const ""
--                , ppUrgent          = id
--                , ppSep             = " : "
--                , ppWsSep           = " "
--                , ppTitle           = shorten 80
--                , ppLayout          = id
--                , ppOrder           = id
--                , ppOutput          = putStrLn
--                , ppSort            = getSortByIndex
--                , ppExtras          = []
--                }
myLogHook = xmobarPP{ 
     ppTitle            = xmobarColor colorA"" . shorten 152
    , ppCurrent         = xmobarColor colorA"" . wrap "" ""
    , ppHidden          = xmobarColor colorFG"" . wrap "" "" 
    , ppHiddenNoWindows = xmobarColor colorBCG"" . wrap "" "" 
    , ppWsSep           = ""
    , ppSep             = ""
    , ppSort            = getSortByIndex
    , ppLayout          = const "" 
    } 
    where
    noScratchPad ws = if ws == "im" then "" else ws
    noScratchPad ws = if ws == "@" then "" else ws

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = myManageHook <+> manageHook defaultConfig
        , layoutHook = mkToggle (single REFLECTX) $ myLayout 
        , workspaces = myWorkspaces
        , terminal = myTerminal
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        --, logHook = fadeInactiveLogHook 0xdddddddd >> dynamicLogWithPP xmobarPP
        , logHook = takeTopFocus >> (dynamicLogWithPP $ myLogHook{ ppOutput = hPutStrLn xmproc })
        -- , logHook = dynamicLogWithPP $ defaultPP{ ppOutput = hPutStrLn xmproc }
        -- , logHook = $ myLogHook{ppOutput = hPutStrLn xmproc}
-- dynamicLogWithPP $ (myPP xmobar)
  
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys` myKeys
        `additionalMouseBindings` myMouse
toggleOrViewNoSP = toggleOrDoSkip ["F1"] W.greedyView
myKeys = [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        --tmux splits
        -- , ((mod1Mask, xK_space),  spawn "xdotool keyup space" >> spawn "xdotool key --clearmodifiers ctrl+b H")
        -- , ((mod1Mask .|. shiftMask, xK_space),  spawn "xdotool keyup space" >> spawn "xdotool key --clearmodifiers ctrl+b V")
        -- --move around windows
        -- , ((mod1Mask , xK_j),  spawn "xdotool keyup j" >> spawn "xdotool key --clearmodifiers ctrl+b o")
        -- , ((mod1Mask , xK_k),  spawn "xdotool keyup k" >> spawn "xdotool key --clearmodifiers ctrl+b O")
        -- -- move panes
        -- , ((mod1Mask .|. shiftMask, xK_j), spawn "xdotool keyup j" >> spawn "xdotool key --clearmodifiers ctrl+b braceright")
        -- , ((mod1Mask .|. shiftMask, xK_k), spawn "xdotool keyup k" >> spawn "xdotool key --clearmodifiers ctrl+b braceleft")
        -- -- switch panes
        -- , ((mod1Mask, xK_1), spawn "xdotool keyup 1" >> spawn "xdotool key --clearmodifiers ctrl+b n")
        -- , ((mod1Mask, xK_2), spawn "xdotool keyup 2" >> spawn "xdotool key --clearmodifiers ctrl+b p")
        -- -- managing panes
        -- , ((mod1Mask, xK_w), spawn "xdotool keyup w" >> spawn "xdotool key --clearmodifiers ctrl+b x")
        -- , ((mod1Mask, xK_t), spawn "xdotool keyup t" >> spawn "xdotool key --clearmodifiers ctrl+b c")
        -- end of tmux
        , ((mod4Mask, xK_r), spawn ("exec " ++ menuCmd))
  	    , ((mod4Mask,xK_c), kill)
        , ((0, xK_Print), spawn "sleep 0.2; scrot -q 100 -e 'mv $f ~/Screenshots/'")
        , ((shiftMask, xK_Print), spawn "sleep 0.2; scrot -q 100 -s -e 'mv $f ~/Screenshots/'")
        , ((mod4Mask .|. shiftMask, xK_s), spawn "sublime_text")
        , ((mod4Mask .|. controlMask              , xK_equal), sendMessage MagnifyMore)
        , ((mod4Mask .|. controlMask              , xK_minus), sendMessage MagnifyLess)
        , ((mod4Mask .|. controlMask              , xK_m    ), sendMessage Mag.Toggle     )
        , ((mod4Mask                              , xK_Tab), toggleWS)
        --, ((mod4Mask                              , xK_F7), spawn "cnee --record -smp --events-to-record 10 -o /tmp/macro.xnr --keyboard; notify-send 'macro recorded'")
        --, ((0                                     , xK_F7), spawn "cnee --replay -f /tmp/macro.xnr")
        --, ((mod4Mask                              , xK_F7), spawn "cnee --record -smp --events-to-record 10 -o /tmp/macro.xnr --keyboard; notify-send 'macro recorded'")
        --, ((0 , xK_F7),runInTerm "" "xmacrorec -k 24 > /tmp/macro.x")
        , ((mod4Mask                              , xK_p), spawn "webrf refresh")
        , ((mod4Mask  .|. shiftMask               , xK_p), spawn "webrf setup")
        --, ((0                                     , xK_F6), spawn "xmacrorec -k 24 > /tmp/macro.x")
        --, ((0                                     , xK_F7), spawn "xmacroplay \"$DISPLAY\" < /tmp/macro.x")
        , ((mod4Mask                              , xK_s), windows W.focusDown) -- %! Move focus to the next window
        , ((mod4Mask                              , xK_a), windows W.focusUp) -- %! Move focus to the next window
        , ((mod1Mask                              , xK_Tab), windows W.focusUp) -- %! Move focus to the next window
        , ((mod1Mask                              , xK_l), windows W.focusUp) -- logout!
        , ((mod4Mask .|. shiftMask, xK_o)         , sendMessage $ Multi.Toggle REFLECTX) -- reflex layout horizontally
        , ((mod4Mask                              , 0xffc1), spawn "xscreensaver & xscreensaver-command -lock") --lock by f4!
        , ((0                                     , xK_XF86Launch1), spawn "xscreensaver & xscreensaver-command -lock") --lock by f4!
        , ((shiftMask                             , xK_XF86Launch1), spawn "sudo pm-suspend") --sleep s!
        --, ((shiftMask .|. controlMask             , xK_b    ), spawn "anamnesis --browser")
        -- , ((mod4Mask  .|. shiftMask               , xK_e    ), spawn "xfce4-terminal -e ranger")
        -- , ((mod4Mask  .|. controlMask               , xK_Return    ), spawn "xfce4-terminal --class \"mailVim\"")
        , ((mod4Mask  .|. shiftMask               , xK_l    ), spawn "sudo pm-hibernate")
        , ((mod4Mask  .|. shiftMask               , xK_u    ), spawn "sudo disk-manager")
        -- increase/decrease transparency
        , ((mod4Mask  .|. shiftMask               , xK_comma), spawn "transset -a --dec .1")
        , ((mod4Mask  .|. shiftMask               , xK_period), spawn "transset -a --inc .1")
        --, ((mod4Mask                              , xK_l    ), spawn "slock")
        , ((0                                     , xK_XF86AudioPlay), spawn "cmus-remote -u")
        , ((0                                     , xK_XF86AudioNext), spawn "cmus-remote -n")
        , ((0                                     , xK_XF86AudioPrev), spawn "cmus-remote -r")
        , ((controlMask                           , xK_XF86AudioPlay), spawn "cmus-remote -s")
        --, ((0                                     , xK_XF86AudioLowerVolume), spawn "amixer set Master 3dB-") -- volume down
        --, ((0                                     , xK_XF86AudioRaiseVolume), spawn "amixer set Master 3dB+") -- volume up
        --, ((0                                     , xK_XF86AudioRaiseVolume), spawn "pacmd dump|awk \'$1~/set-sink-volume/{system (\"pacmd \"$1\" \"$2\" \"$3+2000)}\'") -- volume up
        --, ((0                                     , xK_XF86AudioLowerVolume), spawn "pacmd dump|awk \'$1~/set-sink-volume/{system (\"pacmd \"$1\" \"$2\" \"$3-2000)}\'") -- volume down
        -- , ((0                                     , xK_XF86AudioRaiseVolume), spawn "setVolPactl +3") -- volume up
        -- , ((0                                     , xK_XF86AudioLowerVolume), spawn "setVolPactl -3") -- volume down
        --, ((0                                     , xK_XF86AudioMute), spawn "amixer -c0 sset Master toggle") -- volume up
        , ((0                                     , xK_XF86AudioRaiseVolume), spawn "pactl set-sink-volume 0 -- +3%; pactl set-sink-volume 1 -- +3%") -- volume up
        , ((0                                     , xK_XF86AudioLowerVolume), spawn "pactl set-sink-volume 0 -- -3%; pactl set-sink-volume 1 -- -3%") -- volume down
        , ((0                                     , xK_XF86AudioMute), spawn "pactl set-sink-mute 0 toggle;pactl set-sink-mute 1 toggle") -- volume up
        , ((mod4Mask .|. shiftMask                , xK_y), spawn "youtube-watch")
        -- , ((mod4Mask .|. shiftMask                , xK_t), scratchpadSpawnActionTerminal myTerminal )
        , ((mod4Mask .|. shiftMask, xK_space)     , sendMessage (Tog.ToggleLayout))
       -- >    , ((modm .|. controlMask .|. shiftMask, xK_Right), sendMessage $ Move R)
       , ((mod4Mask .|. controlMask .|. shiftMask, xK_Left ), sendMessage $ Move L)
       , ((mod4Mask .|. controlMask .|. shiftMask, xK_Up   ), sendMessage $ Move U)
       , ((mod4Mask .|. controlMask .|. shiftMask, xK_Down ), windows W.swapUp)
       , ((mod4Mask .|. controlMask, xK_c     ), kill1) -- @@ Close the focused window
       , ((mod4Mask, xK_u), onPrevNeighbour W.view)
       , ((mod4Mask, xK_i), onNextNeighbour W.view)
        ] ++
        zip (zip (repeat mod4Mask) [xK_F1..xK_F3]) (map (withNthWorkspace W.greedyView) [9..])
        ++
        zip (zip (repeat (mod4Mask .|. mod1Mask)) [xK_F1..xK_F3]) (map (withNthWorkspace W.shift) [9..])
        ++
        [((controlMask .|. mod4Mask, k), windows $ f i)
              | (i, k) <- zip (workspaces defaultConfig) [xK_1..xK_9]
              , (f, m) <- [(W.view, 0), (W.shift, shiftMask), (copy, shiftMask .|. controlMask)]]

myTerminal = "roxterm"

myMouse = [
         ((mod4Mask, button2)                    , (\w -> spawn "touchtoggle"))
         ,((mod4Mask .|. shiftMask, button1)                    , (\w -> windows copyToAll))
         ,((mod4Mask .|. shiftMask, button3)                    , (\w -> killAllOtherCopies))
        ]

