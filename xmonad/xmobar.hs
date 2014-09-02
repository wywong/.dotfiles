Config { font = "-misc-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
       , bgColor = "black"
       , fgColor = "grey"
       , position = Bottom
       , lowerOnStart = True
       , commands = [ Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Com "/home/wywong/.scripts/wireless.sh" [] "wifi" 30
                    , Run Com "/home/wywong/.scripts/volume.sh" [] "volume" 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run BatteryP ["BAT1"]
                                   ["-t", "<acstatus> <left>%",
                                    "-L", "10", "-H", "80", "-p", "3",
                                    "--", "-O", "<fc=#00ff00>Charging</fc>:",
                                    "-i", "",
                                    "-o", "Batt",
                                    "-f", "ACAD/online",
                                    "-L", "-15", "-H", "-5",
                                    "-l", "red", "-m", "blue", "-h", "green"]
                                   600
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% %memory% | %volume%| %battery% | %wifi% | <fc=#ee9a00>%date%</fc>"
       }
