import Graphics.X11.ExtraTypes.XF86 (xF86XK_AudioLowerVolume, xF86XK_AudioMute, xF86XK_AudioRaiseVolume, xF86XK_MonBrightnessDown, xF86XK_MonBrightnessUp)
import XMonad
import XMonad.Actions.Volume
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.WallpaperSetter
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
import XMonad.StackSet (RationalRect (..))
import XMonad.Util.Cursor (setDefaultCursor, xC_left_ptr)
import XMonad.Util.EZConfig
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)

myXmobarPP :: PP
myXmobarPP =
  def
    { ppSep = "|",
      ppTitle = (\x -> ""),
      ppLayout = (\x -> ""),
      ppCurrent = (\x -> "<fc=#000000,#FFFFFF> " ++ x ++ " </fc>"),
      ppHidden = (\x -> "[" ++ x ++ "]"),
      ppHiddenNoWindows = (\x -> " " ++ x ++ " "),
      ppWsSep = " "
    }

myLayout = tiled ||| threeCol ||| mirrorT ||| Grid ||| Full
  where
    threeCol = ThreeColMid nmaster delta ratio
    mirrorT = Mirror (Tall 1 (3 / 100) (3 / 5))
    tiled = Tall nmaster delta ratio
    nmaster = 1
    delta = 3 / 100
    ratio = 1 / 2

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
  [ ((mod4Mask .|. shiftMask, xK_f), spawn "firefox"),
    ((mod4Mask .|. shiftMask, xK_p), spawn "dmenu_run -fn FiraMono-9 -nb black -nf \"#cbcbcb\""),
    ((mod4Mask .|. shiftMask, xK_b), spawn "bitwarden-desktop"),
    ((mod4Mask .|. shiftMask, xK_e), spawn "kitty nnn"),
    ((mod4Mask .|. shiftMask, xK_l), spawn "lock"),
    ((mod4Mask .|. shiftMask, xK_s), spawn "pavucontrol-qt"),
    ((mod4Mask, xK_c), spawn "cameractrlsgtk.py"),
    ((mod4Mask, xK_d), spawn "kitty calcurse"),
    ((mod4Mask, xK_p), spawn "tlpui"),
    ((mod4Mask, xK_f), spawn "thinkfan-ui"),
    ((mod4Mask, xK_s), spawn "spotify"),
    ((0, xF86XK_AudioRaiseVolume), raiseVolume 2 >> return ()),
    ((0, xF86XK_AudioLowerVolume), lowerVolume 2 >> return ()),
    ((0, xF86XK_AudioMute), toggleMute >> return ()),
    ((0, xF86XK_MonBrightnessUp), spawn "light -A 10"),
    ((0, xF86XK_MonBrightnessDown), spawn "light -U 10"),
    ((0, xK_Print), spawn "spectacle")
  ]

myManageHook =
  composeOne
    [className =? "SpeedCrunch" -?> doRectFloat $ RationalRect 0.3 0.3 0.4 0.4]

myStartupHook :: X ()
myStartupHook = do
  setDefaultCursor xC_left_ptr
  spawn "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &"
  spawn "feh --bg-fill /home/peska/.wallpapers/"
  spawn "setxkbmap -option \"caps:swapescape\""
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Tapping Enabled\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Tapping Enabled Default\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Drag Enabled\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Drag Enabled Default\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Disable While Typing Enabled\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Disable While Typing Enabled Default\" 1"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myConfig =
  let old_hooks = logHook def
   in def
        { modMask = mod4Mask,
          workspaces = myWorkspaces,
          layoutHook = myLayout,
          manageHook = myManageHook,
          borderWidth = 2,
          terminal = "kitty",
          normalBorderColor = "#000000",
          focusedBorderColor = "#ff007b",
          startupHook = myStartupHook
        }
        `additionalKeys` myKeys

main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
    $ myConfig
