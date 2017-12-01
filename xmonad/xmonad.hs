import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Fullscreen
import System.IO
import XMonad.Prompt
import XMonad.Prompt.Shell

main = do
    spawn "~/bin/switch-monitors.sh"
    spawn "~/.fehbg"
    spawn "compton --xrender-sync --xrender-sync-fence --config ~/.config/compton.conf -b"
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ docks $ fullscreenSupport $ defaultConfig
        { terminal = "urxvt"
        , handleEventHook = fullscreenEventHook <+> handleEventHook defaultConfig
        , manageHook = fullscreenManageHook <+> manageDocks <+> manageHook defaultConfig
        , layoutHook = fullscreenFull $ avoidStruts  $ layoutHook defaultConfig
        }
        `additionalKeys` myKeys

myKeys = [
          ((mod1Mask, xK_c), spawn "firefox-developer")
         ,((mod1Mask, xK_d), spawn "j4-dmenu-desktop")
         ,((mod1Mask .|. shiftMask, xK_p), spawn "shutdown now")
         ,((mod1Mask, xK_p), spawn "reboot")
         ,((0, 0x1008FF13), spawn "pactl set-sink-volume 0 +5%")
         ,((0, 0x1008FF11), spawn "pactl set-sink-volume 0 -5%")
         ,((0, 0x1008FF12), spawn "pactl set-sink-mute 0 toggle")
         ,((0, 0x1008FF02), spawn "xbacklight -inc 5")
         ,((0, 0x1008FF03), spawn "xbacklight -dec 5")
         ,((mod1Mask .|. shiftMask, xK_o), spawn "/home/danno131313/bin/switch-monitors.sh")
         ,((mod1Mask, xK_i), spawn "firefox-developer --private-window=https://bing.com/")
         , ((mod1Mask .|. controlMask, xK_x), shellPrompt testConf)
         ]

testConf :: XPConfig
testConf = def {
    font = "xft:Liberation Mono:size=12"
  , height = 40
               }
