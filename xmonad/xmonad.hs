import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

main =
    do
        xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.xmobarrc"
        xmonad $ defaultConfig
            { manageHook = manageDocks <+> manageHook defaultConfig
            , layoutHook = avoidStruts $ layoutHook defaultConfig
            , terminal = "xfce4-terminal"
            , modMask = mod4Mask
            , borderWidth = 1
            , normalBorderColor = "#dadada"
            , focusedBorderColor = "#00ffd7"
            } `additionalKeysP`
            [ ("M4-l", spawn "xscreensaver-command -lock")
            , ("C-M1-l", nextWS)
            , ("C-M1-h", prevWS)
            , ("C-M1-S-l", shiftToNext)
            , ("C-M1-S-h", shiftToPrev)
            ]
