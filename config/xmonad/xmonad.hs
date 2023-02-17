import XMonad 
import XMonad.Util.EZConfig
--import XMonad.Util.Ungrab
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import Graphics.X11.ExtraTypes.XF86 (xF86XK_AudioRaiseVolume,xF86XK_AudioLowerVolume,xF86XK_AudioMute, xF86XK_MonBrightnessUp, xF86XK_MonBrightnessDown)
import XMonad.Actions.Volume
import XMonad.Util.Brightness
import XMonad.Hooks.WallpaperSetter
import XMonad.Hooks.ManageHelpers
import XMonad.StackSet (RationalRect (..))

myXmobarPP :: PP
myXmobarPP = def
   { ppSep             = "|"
   , ppTitle           = (\x -> "")
   , ppLayout          = (\x -> "")
   , ppCurrent         = (\x -> "<fc=#000000,#FFFFFF> " ++ x ++ " </fc>")
   , ppHidden          = (\x -> "[" ++ x ++ "]")
   , ppHiddenNoWindows = (\x -> " " ++ x ++ " ")
   , ppWsSep           = " "
   }
myLayout = tiled ||| threeCol ||| mirrorT ||| Grid ||| Full
   where
     threeCol = ThreeColMid nmaster delta ratio
     mirrorT  = Mirror (Tall 1 (3/100) (3/5))
     tiled    = Tall nmaster delta ratio
     nmaster  = 1
     delta    = 3/100
     ratio    = 1/2

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
   [ ((mod4Mask .|. shiftMask, xK_f), spawn "firefox")
   , ((mod4Mask .|. shiftMask, xK_p), spawn "dmenu_run -fn FiraMono-8 -nb black -nf \"#cbcbcb\"")
   , ((mod4Mask .|. shiftMask, xK_b), spawn "bitwarden")
   , ((mod4Mask .|. shiftMask, xK_e), spawn "kitty nnn")
   , ((mod4Mask .|. shiftMask, xK_l), spawn "slock")
   , ((mod4Mask .|. shiftMask, xK_s), spawn "pavucontrol-qt")
   , ((0, xF86XK_AudioRaiseVolume), raiseVolume 2 >> return())
   , ((0, xF86XK_AudioLowerVolume), lowerVolume 2 >> return())
   , ((0, xF86XK_AudioMute), toggleMute >> return())
   , ((0, xF86XK_MonBrightnessUp), increase >> return())
   , ((0, xF86XK_MonBrightnessDown), decrease >> return())
   , ((0, xK_Print), spawn "spectacle")
   ]

myManageHook = composeOne
  [ className =? "SpeedCrunch" -?> doRectFloat $ RationalRect 0.3 0.3 0.4 0.4]

myStartupHook :: X ()
myStartupHook = do
   spawn "setxkbmap -option \"caps:swapescape\""
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Tapping Enabled\" 1"
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Tapping Enabled Default\" 1"
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Drag Enabled\" 1"
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Drag Enabled Default\" 1"
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Disable While Typing Enabled\" 1"
   spawn "xinput set-prop \"ELAN0501:01 04F3:3060 Touchpad\" \"libinput Disable While Typing Enabled Default\" 1"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myConfig = def
   { modMask            = mod4Mask
   , workspaces         = myWorkspaces 
   , layoutHook         = myLayout
   , manageHook         = myManageHook
   , borderWidth        = 2
   , terminal           = "kitty"
   , normalBorderColor  = "#000000"
   , focusedBorderColor = "#ff007b"
   , startupHook        = myStartupHook
   , logHook            = wallpaperSetter defWallpaperConf {
                                wallpaperBaseDir = "/home/peska/.wallpapers",
                                wallpapers       = WallpaperList $ map (\x -> (x, WallpaperDir "/home/peska/.wallpapers")) myWorkspaces
   			}
   } `additionalKeys` myKeys

main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey 
     $ myConfig
