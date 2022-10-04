// ~Hack~ Pokemon Radical Red
// #ID = 17361

function raid_catch() => ((dword(0x003924) == 0x949792D && word(0x02BE8A) == 0x07 && prev(word(0x02BE8A)) == 0x00 && word(0x005078)
                 == 0x01) ||
               (dword(0x003924) == 0x949792D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x005078)
                 == 0x01) ||
               (dword(0x003924) == 0x94A4D5D && word(0x02BE8A) == 0x07 && prev(word(0x02BE8A)) == 0x00 && byte(0x000EA8)
                 != 0x02) ||
               (dword(0x003924) == 0x94A4D5D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && byte(0x000EA8)
                 != 0x02))

achievement(
    title = "Smell Ya Later! [m]", description = "Defeat your rival in Pallet Town", points = 2,
    id = 178451, badge = "198870", published = "10/16/2021 4:29:54 AM", modified = "10/17/2021 1:25:25 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x58 && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x146) ||
               (word(0x0406AE) == 0x147) ||
               (word(0x0406AE) == 0x148))
)

achievement(
    title = "Ya Snooze Ya Lose! [m]", description = "Defeat your rival on route 22", points = 5,
    id = 178452, badge = "198871", published = "10/16/2021 4:37:21 AM", modified = "10/17/2021 1:25:07 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7A && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x149) ||
               (word(0x0406AE) == 0x14A) ||
               (word(0x0406AE) == 0x14B))
)

achievement(
    title = "All the Way From the Hoenn Region...", description = "Defeat Brendan in Viridian Forest", points = 5,
    id = 178453, badge = "198872", published = "10/16/2021 4:40:48 AM", modified = "10/17/2021 1:25:38 PM",
    trigger = word(0x0406AE) == 0x2C && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7E && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Falkner the Falconer", description = "Defeat Falkner", points = 5,
    id = 178455, badge = "198874", published = "10/16/2021 4:43:55 AM", modified = "10/19/2021 5:47:47 AM",
    trigger = word(0x0406AE) == 0x2D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5A && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Zephyr", description = "Defeat Falkner on hardcore mode", points = 10,
    id = 178012, badge = "198263", published = "10/13/2021 3:32:03 AM", modified = "10/19/2021 5:47:50 AM",
    trigger = word(0x0406AE) == 0x2D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5A && 
              bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Brock Solid", description = "Defeat Brock", points = 5,
    id = 178456, badge = "198875", published = "10/16/2021 4:45:36 AM", modified = "10/18/2021 6:06:51 PM",
    trigger = word(0x0406AE) == 0x19E && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5A && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Boulder", description = "Defeat Brock on hardcore mode", points = 10,
    id = 178013, badge = "198264", published = "10/13/2021 3:32:25 AM", modified = "10/18/2021 6:06:57 PM",
    trigger = word(0x0406AE) == 0x19E && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5A && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Route 3 Raid Den", description = "Complete the 1 star raid den and attempt to catch the pokemon", points = 3,
    id = 178027, badge = "198278", published = "10/13/2021 4:08:50 AM", modified = "10/13/2021 4:08:50 AM",
    trigger = word(0x03EE10) == 0x67 && word(0x03EE48) == 0x52 && word(0x03EE4A) == 0x13 &&
              raid_catch()
)

achievement(
    title = "Mt. Moon Raid Den", description = "Complete the 1 star raid den and attempt to catch the pokemon", points = 3,
    id = 178028, badge = "198279", published = "10/13/2021 4:11:21 AM", modified = "10/13/2021 4:11:21 AM",
    trigger = word(0x03EE10) == 0x7F && word(0x03EE48) == 0x1C && word(0x03EE4A) == 0x0B && 
              raid_catch()
)

achievement(
    title = "To the Moon!", description = "Clear Mt. Moon", points = 5,
    id = 178457, badge = "198876", published = "10/16/2021 4:47:12 AM", modified = "10/17/2021 1:26:03 PM",
    trigger = word(0x0406AE) == 0x2E && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7F && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Route 4 Raid Den", description = "Complete the 1 star raid den and attempt to catch the pokemon", points = 3,
    id = 178029, badge = "198280", published = "10/13/2021 4:16:22 AM", modified = "10/13/2021 4:16:22 AM",
    trigger = word(0x03EE10) == 0x68 && word(0x03EE48) == 0x41 && word(0x03EE4A) == 0x0C &&
              raid_catch()
)

achievement(
    title = "He's Our Man!", description = "Defeat your rival in Cerulean City", points = 5,
    id = 178458, badge = "198877", published = "10/16/2021 4:52:30 AM", modified = "10/17/2021 1:45:38 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x14C) ||
               (word(0x0406AE) == 0x14D) ||
               (word(0x0406AE) == 0x14E))
)

achievement(
    title = "Route 24 Raid Den", description = "Complete the 1 star raid den and attempt to catch the pokemon", points = 3,
    trigger = word(0x03EE10) == 0x7C && word(0x03EE48) == 0x0E && word(0x03EE4A) == 0x0C &&
              raid_catch()
)

achievement(
    title = "Route 25 Raid Den", description = "Complete the 1 star raid den and attempt to catch the pokemon", points = 3,
    id = 178031, badge = "198282", published = "10/13/2021 4:25:05 AM", modified = "10/13/2021 4:25:05 AM",
    trigger = word(0x03EE10) == 0x7D && word(0x03EE48) == 0x42 && word(0x03EE4A) == 0x0E &&
              raid_catch()
)

achievement(
    title = "Scyther Master Bugsy", description = "Defeat Bugsy", points = 5,
    id = 178459, badge = "198878", published = "10/16/2021 4:54:26 AM", modified = "10/17/2021 1:26:31 PM",
    trigger = word(0x0406AE) == 0x2F && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7D && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Hive", description = "Defeat Bugsy on hardcore mode", points = 10,
    id = 178014, badge = "198265", published = "10/13/2021 3:32:42 AM", modified = "10/17/2021 1:26:48 PM",
    trigger = word(0x0406AE) == 0x2F && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7D && 
              bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "The Misty Mermaid", description = "Defeat Misty", points = 5,
    id = 178460, badge = "198879", published = "10/16/2021 4:56:12 AM", modified = "10/17/2021 1:26:58 PM",
    trigger = word(0x0406AE) == 0x19F && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5B && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Cascade", description = "Defeat Misty on hardcore mode", points = 10,
    id = 178015, badge = "198266", published = "10/13/2021 3:32:57 AM", modified = "10/17/2021 1:27:09 PM",
    trigger = word(0x0406AE) == 0x19F && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5B && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Route 5 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178063, badge = "198398", published = "10/14/2021 6:00:15 AM", modified = "10/14/2021 6:00:15 AM",
    trigger = word(0x03EE10) == 0x69 && word(0x03EE48) == 0x18 && word(0x03EE4A) == 0x27 &&
              raid_catch()
)

achievement(
    title = "Route 6 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178064, badge = "198399", published = "10/14/2021 6:03:50 AM", modified = "10/14/2021 6:03:50 AM",
    trigger = word(0x03EE10) == 0x6A && word(0x03EE48) == 0x1B && word(0x03EE4A) == 0x0E && 
              raid_catch()
)

achievement(
    title = "Rematch with Brendan", description = "Defeat Brendan near Vermillion City", points = 5,
    id = 178461, badge = "198880", published = "10/16/2021 4:58:17 AM", modified = "10/17/2021 1:27:39 PM",
    trigger = word(0x0406AE) == 0x32 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && (word(0x03EE10) == 0x6F || word(0x03EE10) == 0x80) && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Route 11 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178065, badge = "198400", published = "10/14/2021 6:06:59 AM", modified = "10/14/2021 6:06:59 AM",
    trigger = word(0x03EE10) == 0x6F && word(0x03EE48) == 0x14 && word(0x03EE4A) == 0x0B && 
              raid_catch()
)

achievement(
    title = "Dairy Farmer Whitney", description = "Defeat Whitney", points = 5,
    id = 178462, badge = "198881", published = "10/16/2021 5:07:45 AM", modified = "10/17/2021 1:27:39 PM",
    trigger = word(0x0406AE) == 0x31 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x6F && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Plain Hardcore", description = "Defeat Whitney on hardcore mode", points = 10,
    id = 178016, badge = "198267", published = "10/13/2021 3:33:13 AM", modified = "10/17/2021 1:31:52 PM",
    trigger = word(0x0406AE) == 0x31 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x6F && 
              bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Diglett's Cave Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178066, badge = "198401", published = "10/14/2021 6:11:15 AM", modified = "10/14/2021 6:11:15 AM",
    trigger = word(0x03EE10) == 0x83 && word(0x03EE48) == 0x1C && word(0x03EE4A) == 0x1B && 
              raid_catch()
)

achievement(
    title = "Hey Baby! Ready for a Match?", description = "Defeat Lt. Surge", points = 5,
    id = 178463, badge = "198882", published = "10/16/2021 5:10:46 AM", modified = "10/17/2021 1:31:52 PM",
    trigger = word(0x0406AE) == 0x1A0 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5D && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Thunder", description = "Defeat Lt. Surge on hardcore mode", points = 10,
    id = 178017, badge = "198268", published = "10/13/2021 3:33:33 AM", modified = "10/17/2021 1:31:53 PM",
    trigger = word(0x0406AE) == 0x1A0 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5D && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Route 2 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178067, badge = "198402", published = "10/14/2021 6:14:14 AM", modified = "10/14/2021 6:14:14 AM",
    trigger = word(0x03EE10) == 0x66 && word(0x03EE48) == 0x1B && word(0x03EE4A) == 0x46 && 
              raid_catch()
)

achievement(
    title = "Route 9 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178069, badge = "198404", published = "10/14/2021 6:24:22 AM", modified = "10/14/2021 6:24:22 AM",
    trigger = word(0x03EE10) == 0x6D && word(0x03EE48) == 0x0F && word(0x03EE4A) == 0x0A && 
              raid_catch()
)

achievement(
    title = "Route 10 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178068, badge = "198403", published = "10/14/2021 6:19:00 AM", modified = "10/14/2021 6:20:04 AM",
    trigger = word(0x03EE10) == 0x6E && word(0x03EE48) == 0x17 && word(0x03EE4A) == 0x0F && 
              raid_catch()
)

achievement(
    title = "Rock Tunnel Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178070, badge = "198405", published = "10/14/2021 6:28:28 AM", modified = "10/14/2021 6:28:28 AM",
    trigger = word(0x03EE10) == 0x18A && word(0x03EE48) == 0x11 && word(0x03EE4A) == 0x0A && 
              raid_catch()
)

achievement(
    title = "Route 8 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178071, badge = "198406", published = "10/14/2021 6:31:56 AM", modified = "10/14/2021 6:34:41 AM",
    trigger = word(0x03EE10) == 0x6C && word(0x03EE48) == 0x2F && word(0x03EE4A) == 0x12 && 
              raid_catch()
)

achievement(
    title = "Route 16 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178072, badge = "198407", published = "10/14/2021 6:37:43 AM", modified = "10/16/2021 8:28:31 AM",
    trigger = word(0x03EE10) == 0x74 && word(0x03EE48) == 0x2F && word(0x03EE4A) == 0x0E && 
              raid_catch()
)

achievement(
    title = "Erika the Scent-sational", description = "Defeat Erika", points = 5,
    id = 178465, badge = "198884", published = "10/16/2021 5:14:14 AM", modified = "10/17/2021 1:31:53 PM",
    trigger = word(0x0406AE) == 0x1A1 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5E && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Rainbow", description = "Defeat Erika on hardcore mode", points = 10,
    id = 178019, badge = "198270", published = "10/13/2021 3:34:07 AM", modified = "10/17/2021 1:31:53 PM",
    trigger = word(0x0406AE) == 0x1A1 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5E && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Fighting Spirit", description = "Defeat Morty", points = 5,
    id = 178464, badge = "198883", published = "10/16/2021 5:12:13 AM", modified = "10/17/2021 1:31:54 PM",
    trigger = word(0x0406AE) == 0x34 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5C && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Fog", description = "Defeat Morty on hardcore mode", points = 10,
    id = 178018, badge = "198269", published = "10/13/2021 3:33:54 AM", modified = "10/17/2021 1:31:54 PM",
    trigger = word(0x0406AE) == 0x34 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5C && 
              bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Do Not Look Under the Poster", description = "Defeat Giovanni in Rocket Hideout", points = 5,
    id = 178468, badge = "198887", published = "10/16/2021 5:19:04 AM", modified = "10/17/2021 1:31:54 PM",
    trigger = word(0x0406AE) == 0x15C && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x85 && byte(0x005078) != 0x02
)

achievement(
    title = "How Good Are You?", description = "Defeat Boss Giovanni in Silph Co", points = 5,
    id = 178471, badge = "198890", published = "10/16/2021 5:30:02 AM", modified = "10/17/2021 1:31:55 PM",
    trigger = word(0x0406AE) == 0x15D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x86 && byte(0x005078) != 0x02
)

achievement(
    title = "Route 12 Raid Den", description = "Complete the 2 star raid den and attempt to catch the pokemon", points = 3,
    id = 178073, badge = "198408", published = "10/14/2021 6:41:58 AM", modified = "10/14/2021 6:41:58 AM",
    trigger = word(0x03EE10) == 0x70 && word(0x03EE48) == 0x19 && word(0x03EE4A) == 0x41 && 
              raid_catch()
)

achievement(
    title = "Chuck This!", description = "Defeat Chuck", points = 5,
    id = 178466, badge = "198885", published = "10/16/2021 5:15:52 AM", modified = "10/17/2021 1:31:55 PM",
    trigger = word(0x0406AE) == 0x13D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x62 && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Storm", description = "Defeat Chuck on hardcore mode", points = 10,
    id = 178020, badge = "198271", published = "10/13/2021 3:34:26 AM", modified = "10/17/2021 1:31:55 PM",
    trigger = word(0x0406AE) == 0x13D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x62 && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Viridian Forest Raid Den", description = "Complete the raid den and attempt to catch the pokemon", points = 3,
    id = 178074, badge = "198409", published = "10/14/2021 6:57:14 AM", modified = "10/14/2021 6:57:14 AM",
    trigger = word(0x03EE10) == 0x7E && word(0x03EE48) == 0x23 && word(0x03EE4A) == 0x29 && 
              raid_catch()
)

achievement(
    title = "Route 13 Raid Den", description = "Complete the 3 star raid den and attempt to catch the pokemon", points = 3,
    id = 178075, badge = "198410", published = "10/14/2021 7:02:45 AM", modified = "10/14/2021 7:02:45 AM",
    trigger = word(0x03EE10) == 0x71 && word(0x03EE48) == 0x3F && word(0x03EE4A) == 0x0E && 
              raid_catch()
)

achievement(
    title = "Route 14 Raid Den", description = "Complete the 3 star raid den and attempt to catch the pokemon", points = 3,
    id = 178076, badge = "198411", published = "10/14/2021 7:10:13 AM", modified = "10/14/2021 7:10:13 AM",
    trigger = word(0x03EE10) == 0x72 && word(0x03EE48) == 0x11 && word(0x03EE4A) == 0x1C && 
              raid_catch()
)

achievement(
    title = "Route 15 Raid Den", description = "Complete the 3 star raid den and attempt to catch the pokemon", points = 3,
    id = 178077, badge = "198412", published = "10/14/2021 7:14:05 AM", modified = "10/14/2021 7:14:05 AM",
    trigger = word(0x03EE10) == 0x73 && word(0x03EE48) == 0x19 && word(0x03EE4A) == 0x0E && 
              raid_catch()
)

achievement(
    title = "Swift Battle With Koga", description = "Defeat Koga", points = 5,
    id = 178475, badge = "198895", published = "10/16/2021 5:41:11 AM", modified = "10/17/2021 1:31:56 PM",
    trigger = word(0x0406AE) == 0x1A2 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5F && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Soul", description = "Defeat Koga on hardcore mode", points = 10,
    id = 178022, badge = "198273", published = "10/13/2021 3:34:59 AM", modified = "10/17/2021 1:31:56 PM",
    trigger = word(0x0406AE) == 0x1A2 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x5F && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Mega Rivalry", description = "Defeat Brendan near the Safari Zone", points = 5,
    id = 178476, badge = "198896", published = "10/16/2021 5:44:53 AM", modified = "10/17/2021 1:31:56 PM",
    trigger = word(0x0406AE) == 0x39 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5F && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Double Trouble", description = "Defeat Sabrina", points = 5,
    id = 178469, badge = "198888", published = "10/16/2021 5:20:27 AM", modified = "10/17/2021 1:31:57 PM",
    trigger = word(0x0406AE) == 0x1A4 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x62 && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Marsh", description = "Defeat Sabrina on hardcore mode", points = 10,
    id = 178021, badge = "198272", published = "10/13/2021 3:34:42 AM", modified = "10/17/2021 1:31:57 PM",
    trigger = word(0x0406AE) == 0x1A4 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x62 && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Power Plant Raid Den", description = "Complete the raid den and attempt to catch the pokemon", points = 3,
    id = 178079, badge = "198414", published = "10/14/2021 7:30:27 AM", modified = "10/14/2021 7:39:53 AM",
    trigger = word(0x03EE10) == 0x8E && word(0x03EE48) == 0x23 && word(0x03EE4A) == 0x11 && 
              raid_catch()
)

achievement(
    title = "Steeling Victory", description = "Defeat Jasmine", points = 5,
    id = 178478, badge = "198898", published = "10/16/2021 5:48:42 AM", modified = "11/19/2021 4:16:23 AM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x60 && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x3E) ||
               (word(0x0406AE) == 0x3F) ||
               (word(0x0406AE) == 0x40))
)

achievement(
    title = "Hardcore Mineral", description = "Defeat Jasmine on hardcore mode", points = 10,
    id = 178024, badge = "198275", published = "10/13/2021 3:35:32 AM", modified = "11/19/2021 4:16:24 AM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x60 && bit4(0x04325A) == 0x01 && 
              byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x3E) ||
               (word(0x0406AE) == 0x3F) ||
               (word(0x0406AE) == 0x40))
)

achievement(
    title = "Radical May", description = "Defeat May", points = 5,
    id = 178479, badge = "198899", published = "10/16/2021 5:50:01 AM", modified = "10/17/2021 1:31:58 PM",
    trigger = word(0x0406AE) == 0x3D && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x60 && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Pokemon Mansion Raid Den", description = "Complete the raid den and attempt to catch the pokemon", points = 3,
    id = 178078, badge = "198413", published = "10/14/2021 7:18:24 AM", modified = "10/14/2021 7:18:24 AM",
    trigger = word(0x03EE10) == 0x87 && word(0x03EE48) == 0x09 && word(0x03EE4A) == 0x0C && 
              raid_catch()
)

achievement(
    title = "When You're Hot You're Hot", description = "Defeat Blaine", points = 5,
    id = 178480, badge = "198900", published = "10/16/2021 5:51:39 AM", modified = "10/17/2021 1:31:58 PM",
    trigger = word(0x0406AE) == 0x1A3 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x60 && byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Volcano", description = "Defeat Blaine on hardcore mode", points = 10,
    id = 178025, badge = "198276", published = "10/13/2021 3:35:51 AM", modified = "10/17/2021 1:31:59 PM",
    trigger = word(0x0406AE) == 0x1A3 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) ==
               0x60 && bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "The Pryce is Right", description = "Defeat Pryce", points = 5,
    id = 178477, badge = "198897", published = "10/16/2021 5:47:16 AM", modified = "11/19/2021 4:16:24 AM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x78 && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x3A) ||
               (word(0x0406AE) == 0x3B) ||
               (word(0x0406AE) == 0x3C))
)

achievement(
    title = "Hardcore Glacier", description = "Defeat Pryce on hardcore mode", points = 10,
    id = 178023, badge = "198274", published = "10/13/2021 3:35:14 AM", modified = "11/19/2021 4:16:24 AM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x78 && bit4(0x04325A) == 0x01 && 
              byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x3B) ||
               (word(0x0406AE) == 0x3A) ||
               (word(0x0406AE) == 0x3C))
)

achievement(
    title = "Seafoam Raid Den", description = "Complete the raid den and attempt to catch the pokemon", points = 3,
    id = 178080, badge = "198415", published = "10/14/2021 7:38:49 AM", modified = "10/14/2021 7:38:49 AM",
    trigger = word(0x03EE10) == 0x8B && word(0x03EE48) == 0x28 && word(0x03EE4A) == 0x0C &&
              raid_catch()
)

achievement(
    title = "Master Plan", description = "Defeat Giovanni in Cerulean Cave", points = 5,
    id = 178481, badge = "198901", published = "10/16/2021 5:54:14 AM", modified = "10/17/2021 1:32:00 PM",
    trigger = word(0x0406AE) == 0x45 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x8D && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Clairvoyance", description = "Defeat Clair", points = 5,
    id = 178467, badge = "198886", published = "10/16/2021 5:17:30 AM", modified = "10/17/2021 1:32:00 PM",
    trigger = word(0x0406AE) == 0x4A && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x59 && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Hardcore Rising ", description = "Defeat Clair on hardcore mode", points = 10,
    id = 178026, badge = "198277", published = "10/13/2021 3:36:04 AM", modified = "10/17/2021 1:32:00 PM",
    trigger = word(0x0406AE) == 0x4A && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x59 && 
              bit4(0x04325A) == 0x01 && byte(0x005078) != 0x02
)

achievement(
    title = "Cerulean Cave Raid Den", description = "Complete the 6 star raid den and attempt to catch the pokemon", points = 3,
    id = 178081, badge = "198416", published = "10/14/2021 7:39:34 AM", modified = "10/14/2021 7:39:34 AM",
    trigger = word(0x03EE10) == 0x8D && word(0x03EE48) == 0x0A && word(0x03EE4A) == 0x13 && 
              raid_catch()
)

achievement(
    title = "How About a Match?", description = "Defeat Gary on route 22 before the elite 4", points = 5,
    id = 178474, badge = "198893", published = "10/16/2021 5:33:24 AM", modified = "10/17/2021 1:32:01 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x7A && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x1B3) ||
               (word(0x0406AE) == 0x1B4) ||
               (word(0x0406AE) == 0x1B5))
)

achievement(
    title = "Victory Road Raid Den", description = "Complete the 6 star raid den and attempt to catch the pokemon", points = 3,
    id = 178082, badge = "198417", published = "10/14/2021 7:43:35 AM", modified = "10/14/2021 7:43:35 AM",
    trigger = word(0x03EE10) == 0x84 && word(0x03EE48) == 0x34 && word(0x03EE4A) == 0x11 && 
              raid_catch()
)

achievement(
    title = "Dumb*ss Fight", description = "Defeat Soupercell before the Elite Four", points = 2,
    id = 178470, badge = "198889", published = "10/16/2021 5:22:05 AM", modified = "10/17/2021 1:32:01 PM",
    trigger = word(0x0406AE) == 0x18 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x61 && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Radical Champ", description = "Become the League Champion", points = 25,
    id = 178472, badge = "198891", published = "10/16/2021 5:31:30 AM", modified = "10/17/2021 1:32:01 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x89 && byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x1B6) ||
               (word(0x0406AE) == 0x1B7) ||
               (word(0x0406AE) == 0x1B8))
)

achievement(
    title = "Hardcore Radical Champ", description = "Become League Champ on hardcore mode", points = 50,
    id = 178473, badge = "198894", published = "10/16/2021 5:31:36 AM", modified = "10/17/2021 1:32:02 PM",
    trigger = word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x89 && bit4(0x04325A) == 0x01 && 
              byte(0x005078) != 0x02 &&
              ((word(0x0406AE) == 0x1B6) ||
               (word(0x0406AE) == 0x1B7) ||
               (word(0x0406AE) == 0x1B8))
)

achievement(
    title = "Rematch with Brock", description = "Defeat Brock in a rematch", points = 5,
    id = 178482, badge = "198902", published = "10/16/2021 5:57:58 AM", modified = "10/17/2021 1:32:02 PM",
    trigger = word(0x0406AE) == 0x38 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5A && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Rematch with Misty", description = "Defeat Misty in a rematch", points = 5,
    id = 178483, badge = "198903", published = "10/16/2021 5:59:36 AM", modified = "10/17/2021 1:32:02 PM",
    trigger = word(0x0406AE) == 0x30 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5B && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Rematch with Surge", description = "Defeat Lt. Surge in a rematch", points = 5,
    id = 178484, badge = "198904", published = "10/16/2021 6:01:32 AM", modified = "10/17/2021 1:32:03 PM",
    trigger = word(0x0406AE) == 0x33 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5D && 
              byte(0x005078) != 0x02
)

achievement(
    title = "Rematch with Erika", description = "Defeat Erika in a rematch", points = 5,
    id = 178485, badge = "198905", published = "10/16/2021 6:03:11 AM", modified = "10/17/2021 1:32:03 PM",
    trigger = word(0x0406AE) == 0x41 && word(0x02BE8A) == 0x01 && prev(word(0x02BE8A)) == 0x00 && word(0x03EE10) == 0x5E && 
              byte(0x005078) != 0x02
)

achievement(
    title = "You Want One, Don't You?", description = "Purchase a shiny Magikarp", points = 5,
    id = 178488, badge = "198908", published = "10/16/2021 6:56:59 AM", modified = "10/16/2021 6:58:45 AM",
    trigger = word(0x039DBC) == 0x10 && (prev(dword(0x02D7BC)) - dword(0x02D7BC)) == 0x124F8
)

achievement(
    title = "HM Master", description = "Collect all of the HMs", points = 5,
    id = 178486, badge = "198921", published = "10/16/2021 6:20:46 AM", modified = "10/16/2021 8:27:03 AM",
    trigger = word(0x044428) == 0x156 && word(0x04442C) == 0x157 && word(0x044430) == 0x158
)

achievement(
    title = "TM Master [m]", description = "Collect all of the TMs and open your TM case", points = 50,
    id = 178487, badge = "198907", published = "10/16/2021 6:39:00 AM",
    trigger = ((word(0x0445BC) == 0x1BA) && word(0x0445BE) == 0x01 && dword(0x003924) == 0x949792D || (word(0x0445e8) == 0x1BA) && word(0x0445ea) == 0x01 && dword(0x003924) == 0x94A4D5D)
)

achievement(
    title = "Pokemon Collector", description = "Catch 100 unique Pokemon and open the pokedex", points = 10,
    id = 178295, badge = "198570", published = "10/15/2021 3:31:27 AM", modified = "10/15/2021 3:31:27 AM",
    trigger = word(0x00B3EC) >= 0x64 && word(0x00B3EC) <= 0x382 && byte(0x047174) == 0x01
)

achievement(
    title = "Pokemon Hobbyist", description = "Catch 250 unique Pokemon and open the pokedex", points = 10,
    id = 178296, badge = "198571", published = "10/15/2021 3:31:48 AM", modified = "10/15/2021 5:56:00 AM",
    trigger = word(0x00B3EC) >= 0xFA && word(0x00B3EC) <= 0x382 && byte(0x047174) == 0x01
)

achievement(
    title = "Pokemon Zookeeper", description = "Catch 500 unique Pokemon and open the pokedex", points = 25,
    id = 178297, badge = "198572", published = "10/15/2021 3:32:04 AM", modified = "10/15/2021 3:32:04 AM",
    trigger = word(0x00B3EC) >= 0x1F4 && word(0x00B3EC) <= 0x382 && byte(0x047174) == 0x01
)

achievement(
    title = "Pokemon Hoarder", description = "Catch 750 unique Pokemon and open the pokedex", points = 50,
    id = 178298, badge = "198573", published = "10/15/2021 3:32:28 AM", modified = "10/16/2021 7:07:29 AM",
    trigger = word(0x00B3EC) >= 0x2EE && word(0x00B3EC) <= 0x382 && byte(0x047174) == 0x01
)

achievement(
    title = "Gotta Catch 'Em All", description = "Catch every unique Pokemon and open the pokedex", points = 100,
    id = 178299, badge = "198574", published = "10/15/2021 3:32:42 AM", modified = "10/15/2021 3:32:42 AM",
    trigger = word(0x00B3EC) >= 0x365 && word(0x00B3EC) <= 0x382 && byte(0x047174) == 0x01
)
