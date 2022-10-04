// SSX 3
// #ID = 2928
// MD5: 662c2c9772ef2943d4fdefa2c496a934

// $44C479: 24bit Actions Counter
//          (useful for preventing achievements popping up when loading the game)
function action_counter() => tbyte(0x44C479)

// $4A19D8: 8bit Lodge Flag
//          00 - No
//          01 - Yes
function lodge_flag() => byte(0x4A19D8)

// $4A6CA8: Moby Pointer
function moby_pointer() => 0x4A6CA8

// $4A7C30: Kaori Pointer
function kaori_pointer() => 0x4A7C30

// $4A8BB8: Allegra Pointer
function allegra_pointer() => 0x4A8BB8

// $4A9B40: Mac Pointer
function mac_pointer() => 0x4A9B40

// $4AAAC8: Zoe Pointer
function zoe_pointer() => 0x4AAAC8

// $4ABA50: Griff Pointer
function griff_pointer() => 0x4ABA50

// $4AC9D8: Elise Pointer
function elise_pointer() => 0x4AC9D8

// $4AD960: Nate Pointer
function nate_pointer() => 0x4AD960

// $4AE8E8: Psymon Pointer
function psymon_pointer() => 0x4AE8E8

// $4AF870: Viggo Pointer
function viggo_pointer() => 0x4AF870

// $5305F0: 8bit Level/Area (careful, sticky)
//          00 - Snow Jam
//          01 - Metro-City
//          02 - Ruthless Ridge
//          03 - Intimidator
//          04 - Gravitude
//          05 - R&B
//          06 - Style Mile
//          07 - Kick Doubt
//          08 - Crow's Nest
//          09 - Launch Time
//          0a - Much-2-Much
//          0b - The Junction
//          0c - Schizophrenia
//          0d - Perpendiculous
//          0e - Happiness
//          0f - Ruthless
//          10  - The Throne
//          11 - Green Station
//          12 - Blue Station
//          13 - Yellow Station
//          14 - Red Station
//          15 - Black Station
function area() => byte(0x5305F0)
areas = {
    0: "Snow Jam",
    1: "Metro-City",
    2: "Ruthless Ridge",
    3: "Intimidator",
    4: "Gravitude",
    5: "R&B",
    6: "Style Mile",
    7: "Kick Doubt",
    8: "Crow's Nest",
    9: "Launch Time",
    10: "Much-2-Much",
    11: "The Junction",
    12: "Schizophrenia",
    13: "Perpendiculous",
    14: "Happiness",
    15: "Ruthless",
    16: "The Throne",
    17: "Green Station",
    18: "Blue Station",
    19: "Yellow Station",
    20: "Red Station",
    21: "Black Station",
}

// $5305F9: 8bit Game Mode (sticky)
//          00 - Conquer The Mountain
//          01 - Single Event
//          02 - Multi Play
function game_mode() => byte(0x5305F9)
game = {
    0: "conquering the mountain",
    1: "doing a single event",
    2: "playing multiplayer",
}

// $534FF1: 8bit
//          Character Selection (not specific to mode)
//          00 - Moby
//          01 - Kaori
//          02 - Allegra
//          03 - Mac
//          04 - Zoe
//          05 - Griff
//          06 - Elise
//          07 - Nate
//          08 - Psymon
//          09 - Viggo
//          Other character addresses -> 0x53500d, 0x535b31, 0x535b4d
function current_char() => byte(0x534FF1)
character = {
    0: "Moby",
    1: "Kaori",
    2: "Allegra",
    3: "Mac",
    4: "Zoe",
    5: "Griff",
    6: "Elise",
    7: "Nate",
    8: "Psymon",
    9: "Viggo",
}

// $87ABB0: 32bit Cheat Protection
//          Seems to consistantly be 0xffffffff when not in the title menus, some sort of counter
function game_state() => dword(0x87ABB0)

//protects against cheating for most achievements
function no_cheating() => unless(action_counter() <= 1) && unless(game_state() != 0xffffffff)

//protection against cheating for any achievement that can be unlocked while in the lodge
function no_cheating_lodge() => unless(action_counter() <= 1) && (lodge_flag() == 0x01 || game_state() == 0xffffffff)

//the address where each character's data starts
char_pointers = [moby_pointer(), kaori_pointer(), allegra_pointer(), mac_pointer(), zoe_pointer(), griff_pointer(), elise_pointer(), nate_pointer(), psymon_pointer(), viggo_pointer()]

//returns an array of the character addresses with the specified offset to the character pointer for each character
function char_offset(offset)
{
  offset_array = []
  for item in char_pointers
  {
      array_push(offset_array, item + offset) 
  }
  
  return offset_array
}

//returns 32-bit value of the current character at the offset
function current_char_dword(offset)
{
    return dword(0x4A6CA8 +                // base pointer (for element 0 of array)
                 current_char() * 0xF88 +  // each array element is 0xF88 bytes long, selected character is array index
                 offset)                   // offset within array element
} 

//1. Collect a snowflake at Happiness (2 points)

achievement(
    title = "Happy Little Snowflake", description = "Collect your first snowflake at Happiness", points = 2,
    trigger = no_cheating() && area() == 0x0e && any_of(char_offset(0xAC), a => byte
    (a) == 0x01 && prev(byte(a)) == 0x00)
)

//2. Win a medal at the Snow Jam race competition (3 points)

achievement(
    title = "Snow Jam Racing", description = "Win a medal at the Snow Jam race competition", points = 3,
    trigger = no_cheating() && area() == 0x00 && any_of(char_offset(0xB31), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//3. Win a medal at the Junction freestyle competition (3 points)

achievement(
    title = "Freestylin", description = "Win a medal at the Junction freestyle competition", points = 3,
    trigger = no_cheating() && area() == 0x0b && any_of(char_offset(0xB89), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//4. Complete the first BIG challenge at Crow's Nest (3 points)

achievement(
    title = "Pop the Kitty!", description = "Complete the first BIG challenge at Crow's Nest", points = 3,
    trigger = no_cheating() && area() == 0x08 && any_of(char_offset(0x118), a => byte
    (a) == 0x0a && prev(byte(a)) == 0x12)
)

//1. Complete Peak 1 Race (5 points)

achievement(
    title = "Peak of Happiness", description = "Complete Peak 1 Race", points = 5,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAD1), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//2. Complete Peak 1 Jam (5 points)

achievement(
    title = "Peak Scoring", description = "Complete Peak 1 Jam", points = 5,
    trigger = no_cheating() && area() == 0x05 && any_of(char_offset(0xAE9), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//3. Complete Peak 2 Race (5 points)

achievement(
    title = "Ruthless Peak", description = "Complete Peak 2 Race", points = 5,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAD9), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//4. Complete Peak 2 Jam (5 points)

achievement(
    title = "Super Uber Jam", description = "Complete Peak 2 Jam", points = 5,
    trigger = no_cheating() && area() == 0x06 && any_of(char_offset(0xAF1), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff)
)

//5. Peak 1 Earnings Goal (5 points)

achievement(
    title = "Going Pro", description = "Complete peak 1 earnings goal", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xF29), a => bit6
    (a) == 1 && prev(bit6(a)) == 0)
)

//6. Peak 2 Earnings Goal (5 points)

achievement(
    title = "High Roller", description = "Complete peak 2 earnings goal", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xF29), a => bit7
    (a) == 1 && prev(bit7(a)) == 0)
)

//7. Peak 1 Freeride (5-10 points)

achievement(
    title = "Novice Challenger", description = "Complete peak 1 exploration goal", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xF29), a => bit3
    (a) == 1 && prev(bit3(a)) == 0)
)

//8. Peak 2 Freeride (5-10 points)

achievement(
    title = "Pro Challenger", description = "Complete peak 2 exploration goal", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xF29), a => bit4
    (a) == 1 && prev(bit4(a)) == 0)
)

//9. Cheat character unlocks x 20 (5 points for bought ones, ~5-25 for earned)

achievement(
    title = "Brodi", description = "Unlock Brodi", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit0
    (a) == 1 && prev(bit0(a)) == 0)
)

achievement(
    title = "Eddie", description = "Unlock Eddie", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit1
    (a) == 1 && prev(bit1(a)) == 0)
)

achievement(
    title = "JP", description = "Unlock JP", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit2
    (a) == 1 && prev(bit2(a)) == 0)
)

achievement(
    title = "Luther", description = "Unlock Luther", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit3
    (a) == 1 && prev(bit3(a)) == 0)
)

achievement(
    title = "Marisol", description = "Unlock Marisol", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit4
    (a) == 1 && prev(bit4(a)) == 0)
)

achievement(
    title = "Marty", description = "Unlock Marty", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit5
    (a) == 1 && prev(bit5(a)) == 0)
)

achievement(
    title = "Seeiah", description = "Unlock Seeiah", points = 5,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit6
    (a) == 1 && prev(bit6(a)) == 0)
)

achievement(
    title = "Hiro", description = "Unlock Hiro by collecting the trading cards", points = 10,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF57), a => bit7
    (a) == 1 && prev(bit7(a)) == 0)
)

achievement(
    title = "Jurgen", description = "Unlock Jurgen by completing all the peak 1 goals", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF58), a => bit0
    (a) == 1 && prev(bit0(a)) == 0)
)

achievement(
    title = "Svelte Luther", description = "Unlock Svelte Luther by collecting all the toys", points = 10,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF58), a => bit1
    (a) == 1 && prev(bit1(a)) == 0)
)

achievement(
    title = "Stretch", description = "Unlock Stretch by collecting all the posters", points = 10,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF58), a => bit2
    (a) == 1 && prev(bit2(a)) == 0)
)

achievement(
    title = "Cudmore", description = "Unlock Cudmore by completing the peak 3 earnings goal", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF58), a => bit3
    (a) == 1 && prev(bit3(a)) == 0)
)

achievement(
    title = "Bunny-San", description = "Unlock Bunny-San by collecting all the art", points = 10,
    trigger = no_cheating_lodge() && any_of(char_offset(0xF58), a => bit4
    (a) == 1 && prev(bit4(a)) == 0)
)

achievement(
    title = "Churchill", description = "Unlock Churchill by finishing all Peak 3 events", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF58), a => bit5
    (a) == 1 && prev(bit5(a)) == 0)
)

achievement(
    title = "Gutless", description = "Unlock Gutless by getting a medal in all events", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF58), a => bit6
    (a) == 1 && prev(bit6(a)) == 0)
)

achievement(
    title = "Snowballs", description = "Unlock Snowballs by completing all the peak 2 goals", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF58), a => bit7
    (a) == 1 && prev(bit7(a)) == 0)
)

achievement(
    title = "NW Legend", description = "Unlock NW Legend by completing all the peak 3 goals", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF59), a => bit0
    (a) == 1 && prev(bit0(a)) == 0)
)

achievement(
    title = "Unknown Rider", description = "Unlock Unknown Rider by completing all the peak 3 race goals", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF59), a => bit1
    (a) == 1 && prev(bit1(a)) == 0)
)

achievement(
    title = "Canhuck", description = "Unlock Canhuck by completing the peak 3 exploration goal", points = 10,
    trigger = no_cheating() && any_of(char_offset(0xF59), a => bit2
    (a) == 1 && prev(bit2(a)) == 0)
)

achievement(
    title = "Far East Myth", description = "Unlock Far East Myth by getting 100 percent on all mountain stats", points = 50,
    trigger = no_cheating() && any_of(char_offset(0xF59), a => bit3
    (a) == 1 && prev(bit3(a)) == 0)
)

//10. Career highlights x 24 (~2-5 points each)

achievement(
    title = "Da House Cat", description = "Stay on a rail for 25 meters", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xE14), a => dword
    (a) >= 0x9C4 && prev(dword(a)) < 0x9C4)
)

achievement(
    title = "Thrice", description = "Stay on a rail for 120 meters", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xE14), a => dword
    (a) >= 0x2EE0 && prev(dword(a)) < 0x2EE0)
)

achievement(
    title = "Swollen Member", description = "Stay on a rail for 300 meters", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xE14), a => dword
    (a) >= 0x7530 && prev(dword(a)) < 0x7530)
)

achievement(
    title = "Yellowcard", description = "Hold a handplant for 3 seconds", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xE0C), a => dword
    (a) >= 0x3 && prev(dword(a)) < 0x3)
)

achievement(
    title = "Alpine Star", description = "Hold a handplant for 5 seconds", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xE0C), a => dword
    (a) >= 0x5 && prev(dword(a)) < 0x5)
)

achievement(
    title = "MxPx", description = "Hold a handplant for 8 seconds", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xE0C), a => dword
    (a) >= 0x8 && prev(dword(a)) < 0x8)
)

achievement(
    title = "Aphrodite", description = "Stay in the air for 5 seconds", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xE1C), a => dword
    (a) >= 0x5 && prev(dword(a)) < 0x5)
)

achievement(
    title = "Ultimate dnL BOOST", description = "Stay in the air for 8 seconds", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xE1C), a => dword
    (a) >= 0x8 && prev(dword(a)) < 0x8)
)

achievement(
    title = "Deepsky", description = "Stay in the air for 9 seconds", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xE1C), a => dword
    (a) >= 0x9 && prev(dword(a)) < 0x9)
)

achievement(
    title = "Fischerspoon", description = "Knockdown 3 people in a race", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xDE4), a => dword
    (a) >= 0x3 && prev(dword(a)) < 0x3)
)

achievement(
    title = "Basement Jaxx", description = "Knockdown 6 people in a race", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xDE4), a => dword
    (a) >= 0x6 && prev(dword(a)) < 0x6)
)

achievement(
    title = "N.E.R.D. Fly or Die", description = "Knockdown 10 people in a race", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xDE4), a => dword
    (a) >= 0x0a && prev(dword(a)) < 0x0a)
)

achievement(
    title = "Finger 11", description = "Perform 5 Ubergrinds in an event", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xDFC), a => dword
    (a) >= 0x5 && prev(dword(a)) < 0x5)
)

achievement(
    title = "Autopilot Off", description = "Perform 8 Ubergrinds in an event", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xDFC), a => dword
    (a) >= 0x8 && prev(dword(a)) < 0x8)
)

achievement(
    title = "The Automator", description = "Perform 10 Ubergrinds in an event", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xDFC), a => dword
    (a) >= 0x0a && prev(dword(a)) < 0x0a)
)

achievement(
    title = "Black Eyed Peas", description = "Perform 5 Super Ubers in an event", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xDF4), a => dword
    (a) >= 0x5 && prev(dword(a)) < 0x5)
)

achievement(
    title = "Placebo", description = "Perform 8 Super Ubers in an event", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xDF4), a => dword
    (a) >= 0x8 && prev(dword(a)) < 0x8)
)

achievement(
    title = "Overseer", description = "Perform 10 Super Ubers in an event", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xDF4), a => dword
    (a) >= 0x0a && prev(dword(a)) < 0x0a)
)

achievement(
    title = "Chemical Brother", description = "Score 150,000 points in an event", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xE2C), a => dword
    (a) >= 0x249F0 && prev(dword(a)) < 0x249F0)
)

achievement(
    title = "Ultimate dnL FLIPIT", description = "Score 500,000 points in an event", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xE2C), a => dword
    (a) >= 0x7A120 && prev(dword(a)) < 0x7A120)
)

achievement(
    title = "X-Ecutioner", description = "Score 1,000,000 points in an event", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xE2C), a => dword
    (a) >= 0xF4240 && prev(dword(a)) < 0xF4240)
)

achievement(
    title = "Audio Bully", description = "Achieve a 10x combo in an event", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xE04), a => dword
    (a) >= 0x0a && prev(dword(a)) < 0x0a)
)

achievement(
    title = "Stoneage", description = "Achieve a 20x combo in an event", points = 3,
    trigger = no_cheating() && any_of(char_offset(0xE04), a => dword
    (a) >= 0x14 && prev(dword(a)) < 0x14)
)

achievement(
    title = "Juana's Addiction", description = "Achieve a 100x combo in an event", points = 5,
    trigger = no_cheating() && any_of(char_offset(0xE04), a => dword
    (a) >= 0x64 && prev(dword(a)) < 0x64)
)

//11. Max a character's attributes (10 points)

achievement(
    title = "Riding Maxed", description = "Max a character's attributes", points = 10,
    trigger = no_cheating_lodge() && any_of(char_offset(0xBDF), a => byte
    (a) == 0x37 && byte(a+1) == 0x37 && byte(a+2) == 0x37 && byte(a+3) == 0x37 && byte(a+4) == 0x37 && byte(a+5) == 0x37 && byte(a+6) == 0x37 && 
    (prev(byte(a)) + prev(byte(a+1)) + prev(byte(a+2)) + prev(byte(a+3)) + prev(byte(a+4)) + prev(byte(a+5)) + prev(byte(a+6)) < 0x181))
)

//12. Collect all of the snowflakes in an area x 22 (5 points each, 2 for stations, 3 for small tracks)

achievement(
    title = "Snow Jam Snowflakes", description = "Collect all of the snowflakes at Snow Jam", points = 5,
    trigger = no_cheating() && area() == 0x00 && any_of(char_offset(0x4), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "Metro-City Snowflakes", description = "Collect all of the snowflakes at Metro-City", points = 5,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0x10), a => dword
    (a) >= 35 && prev(dword(a)) < 35)
)

achievement(
    title = "Ruthless Ridge Snowflakes", description = "Collect all of the snowflakes at Ruthless Ridge", points = 5,
    trigger = no_cheating() && area() == 0x02 && any_of(char_offset(0x1C), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "Intimidator Snowflakes", description = "Collect all of the snowflakes at Intimidator", points = 5,
    trigger = no_cheating() && area() == 0x03 && any_of(char_offset(0x28), a => dword
    (a) >= 25 && prev(dword(a)) < 25)
)

achievement(
    title = "Gravitude Snowflakes", description = "Collect all of the snowflakes at Gravitude", points = 5,
    trigger = no_cheating() && area() == 0x04 && any_of(char_offset(0x34), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "R&B Snowflakes", description = "Collect all of the snowflakes at R&B", points = 5,
    trigger = no_cheating() && area() == 0x05 && any_of(char_offset(0x40), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "Style Mile Snowflakes", description = "Collect all of the snowflakes at Style Mile", points = 5,
    trigger = no_cheating() && area() == 0x06 && any_of(char_offset(0x4C), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "Kick Doubt Snowflakes", description = "Collect all of the snowflakes at Kick Doubt", points = 5,
    trigger = no_cheating() && area() == 0x07 && any_of(char_offset(0x58), a => dword
    (a) >= 30 && prev(dword(a)) < 30)
)

achievement(
    title = "Crow's Nest Snowflakes", description = "Collect all of the snowflakes at Crow's Nest", points = 3,
    trigger = no_cheating() && area() == 0x08 && any_of(char_offset(0x64), a => dword
    (a) >= 2 && prev(dword(a)) < 2)
)

achievement(
    title = "Launch Time Snowflakes", description = "Collect all of the snowflakes at Launch Time", points = 3,
    trigger = no_cheating() && area() == 0x09 && any_of(char_offset(0x70), a => dword
    (a) >= 4 && prev(dword(a)) < 4)
)

achievement(
    title = "Much-2-Much Snowflakes", description = "Collect all of the snowflakes at Much-2-Much", points = 3,
    trigger = no_cheating() && area() == 0x0a && any_of(char_offset(0x7C), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "The Junction Snowflakes", description = "Collect all of the snowflakes at The Junction", points = 3,
    trigger = no_cheating() && area() == 0x0b && any_of(char_offset(0x88), a => dword
    (a) >= 4 && prev(dword(a)) < 4)
)

achievement(
    title = "Schizophrenia Snowflakes", description = "Collect all of the snowflakes at Schizophrenia", points = 3,
    trigger = no_cheating() && area() == 0x0c && any_of(char_offset(0x94), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "Perpendiculous Snowflakes", description = "Collect all of the snowflakes at Perpendiculous", points = 3,
    trigger = no_cheating() && area() == 0x0d && any_of(char_offset(0xA0), a => dword
    (a) >= 8 && prev(dword(a)) < 8)
)

achievement(
    title = "Happiness Snowflakes", description = "Collect all of the snowflakes at Happiness", points = 5,
    trigger = no_cheating() && area() == 0x0e && any_of(char_offset(0xAC), a => dword
    (a) >= 44 && prev(dword(a)) < 44)
)

achievement(
    title = "Ruthless Snowflakes", description = "Collect all of the snowflakes at Ruthless", points = 5,
    trigger = no_cheating() && area() == 0x0f && any_of(char_offset(0xB8), a => dword
    (a) >= 44 && prev(dword(a)) < 44)
)

achievement(
    title = "The Throne Snowflakes", description = "Collect all of the snowflakes at The Throne", points = 5,
    trigger = no_cheating() && area() == 0x10 && any_of(char_offset(0xC4), a => dword
    (a) >= 44 && prev(dword(a)) < 44)
)

achievement(
    title = "Green Station Snowflakes", description = "Collect all of the snowflakes at Green Station", points = 2,
    trigger = no_cheating() && area() == 0x11 && any_of(char_offset(0xD0), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "Blue Station Snowflakes", description = "Collect all of the snowflakes at Blue Station", points = 2,
    trigger = no_cheating() && area() == 0x12 && any_of(char_offset(0xDC), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "Yellow Station Snowflakes", description = "Collect all of the snowflakes at Yellow Station", points = 2,
    trigger = no_cheating() && area() == 0x13 && any_of(char_offset(0xE8), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "Red Station Snowflakes", description = "Collect all of the snowflakes at Red Station", points = 2,
    trigger = no_cheating() && area() == 0x14 && any_of(char_offset(0xF4), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

achievement(
    title = "Black Station Snowflakes", description = "Collect all of the snowflakes at Black Station", points = 2,
    trigger = no_cheating() && area() == 0x15 && any_of(char_offset(0x100), a => dword
    (a) >= 5 && prev(dword(a)) < 5)
)

//1. Platinum Medals x 26 (probably ~10 each?, they're pretty hard but they can probably be chained once you get a feel for the game. maybe 25 for some)

achievement(
    title = "Snow Jam Platinum Challenge", description = "Achieve a platinum medal at Snow Jam", points = 10,
    trigger = no_cheating() && area() == 0x00 && any_of(char_offset(0xB31), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Metro-City Platinum Challenge", description = "Achieve a platinum medal at Metro-City", points = 10,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xB39), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Ruthless Ridge Platinum Challenge", description = "Achieve a platinum medal at Ruthless Ridge", points = 10,
    trigger = no_cheating() && area() == 0x02 && any_of(char_offset(0xB41), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Intimidator Platinum Challenge", description = "Achieve a platinum medal at Intimidator", points = 10,
    trigger = no_cheating() && area() == 0x03 && any_of(char_offset(0xB49), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Gravitude Platinum Challenge", description = "Achieve a platinum medal at Gravitude", points = 10,
    trigger = no_cheating() && area() == 0x04 && any_of(char_offset(0xB51), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "R&B Platinum Challenge", description = "Achieve a platinum medal at R&B", points = 10,
    trigger = no_cheating() && area() == 0x05 && any_of(char_offset(0xB59), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Style Mile Platinum Challenge", description = "Achieve a platinum medal at Style Mile", points = 10,
    trigger = no_cheating() && area() == 0x06 && any_of(char_offset(0xB61), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Kick Doubt Platinum Challenge", description = "Achieve a platinum medal at Kick Doubt", points = 10,
    trigger = no_cheating() && area() == 0x07 && any_of(char_offset(0xB69), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Crow's Nest Platinum Challenge", description = "Achieve a platinum medal at Crow's Nest", points = 10,
    trigger = no_cheating() && area() == 0x08 && any_of(char_offset(0xB71), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Launch Time Platinum Challenge", description = "Achieve a platinum medal at Launch Time", points = 10,
    trigger = no_cheating() && area() == 0x09 && any_of(char_offset(0xB79), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Much-2-Much Platinum Challenge", description = "Achieve a platinum medal at Much-2-Much", points = 10,
    trigger = no_cheating() && area() == 0x0a && any_of(char_offset(0xB81), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "The Junction Platinum Challenge", description = "Achieve a platinum medal at The Junction", points = 10,
    trigger = no_cheating() && area() == 0x0b && any_of(char_offset(0xB89), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Schizophrenia Platinum Challenge", description = "Achieve a platinum medal at Schizophrenia", points = 10,
    trigger = no_cheating() && area() == 0x0c && any_of(char_offset(0xB91), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Perpendiculous Platinum Challenge", description = "Achieve a platinum medal at Perpendiculous", points = 10,
    trigger = no_cheating() && area() == 0x0d && any_of(char_offset(0xB99), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Happiness Race Platinum Challenge", description = "Achieve a platinum medal at Happiness", points = 10,
    trigger = no_cheating() && area() == 0x0e && any_of(char_offset(0xB01), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Ruthless Race Platinum Challenge", description = "Achieve a platinum medal at Ruthless", points = 10,
    trigger = no_cheating() && area() == 0x0f && any_of(char_offset(0xB11), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "The Throne Race Platinum Challenge", description = "Achieve a platinum medal at The Throne", points = 10,
    trigger = no_cheating() && area() == 0x10 && any_of(char_offset(0xB21), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Happiness Freestyle Platinum Challenge", description = "Achieve a platinum medal at Happiness (freestyle)", points = 10,
    trigger = no_cheating() && area() == 0x0e && any_of(char_offset(0xB09), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Ruthless Freestyle Platinum Challenge", description = "Achieve a platinum medal at Ruthless (freestyle)", points = 10,
    trigger = no_cheating() && area() == 0x0f && any_of(char_offset(0xB19), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "The Throne Freestyle Platinum Challenge", description = "Achieve a platinum medal at The Throne (freestyle)", points = 10,
    trigger = no_cheating() && area() == 0x10 && any_of(char_offset(0xB29), a => byte
    (a) == 0 && prev(byte(a)) > 0)
)

achievement(
    title = "Peak 1 Race Gold Challenge", description = "Achieve a gold medal at Peak 1 Race", points = 10,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAD1), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

achievement(
    title = "Peak 2 Race Gold Challenge", description = "Achieve a gold medal at Peak 2 Race", points = 10,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAD9), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

achievement(
    title = "All-Peak Race Gold Challenge", description = "Achieve a gold medal at All-Peak Race", points = 10,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAE1), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

achievement(
    title = "Peak 1 Jam Gold Challenge", description = "Achieve a gold medal at Peak 1 Jam", points = 10,
    trigger = no_cheating() && area() == 0x05 && any_of(char_offset(0xAE9), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

achievement(
    title = "Peak 2 Jam Gold Challenge", description = "Achieve a gold medal at Peak 2 Jam", points = 10,
    trigger = no_cheating() && area() == 0x06 && any_of(char_offset(0xAF1), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

achievement(
    title = "All-Peak Jam Gold Challenge", description = "Achieve a gold medal at All-Peak Jam", points = 10,
    trigger = no_cheating() && area() == 0x01 && any_of(char_offset(0xAF9), a => byte
    (a) <= 1 && prev(byte(a)) > 1)
)

//2. Complete the all-peak race in conquer the mountain with rider rank 1 (50 points)

achievement(
    title = "All-Peak Race RR1 Challenge", description = "Complete the All-Peak Race with rider rank 1", points = 50,
    trigger = no_cheating() && area() == 0x01 && game_mode() == 0x00 && any_of(char_offset(0xAE1), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff && byte(a+0xFE) == 5 && byte(a+0xFF) == 5 && byte(a+0x100) == 5 && byte(a+0x101) == 5 && byte(a+0x102) == 5 && byte(a+0x103) == 5 && byte(a+0x104) == 5)
)

//3. Complete the all-peak jam in conquer the mountain with rider rank 1 (50 points)

achievement(
    title = "All-Peak Jam RR1 Challenge", description = "Complete the All-Peak Jam with rider rank 1", points = 50,
    trigger = no_cheating() && area() == 0x01 && game_mode() == 0x00 && any_of(char_offset(0xAF9), a => byte
    (a) <= 0x03 && prev(byte(a)) == 0xff && byte(a+0xE6) == 5 && byte(a+0xE7) == 5 && byte(a+0xE8) == 5 && byte(a+0xE9) == 5 && byte(a+0xEA) == 5 && byte(a+0xEB) == 5 && byte(a+0xEC) == 5)
)

rich_presence_conditional_display(game_state() != 0xffffffff, "Title Screen")
rich_presence_display("{0} is {1} at {2}",
    rich_presence_lookup("char", current_char(), character),
    rich_presence_lookup("mode", game_mode(), game),
    rich_presence_lookup("place", area(), areas)
)

leaderboard(
    title = "Snow Jam", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 00
    && any_of(char_offset(0xB34), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB34), 
    format="SECS", lower_is_better=true, id=0
)

leaderboard(
    title = "Metro-City", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 01
    && any_of(char_offset(0xB3C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB3C), 
    format="SECS", lower_is_better=true, id=1
)

leaderboard(
    title = "Happiness - Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 14
    && any_of(char_offset(0xB04), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB04), 
    format="SECS", lower_is_better=true, id=2
)

leaderboard(
    title = "Peak 1 Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 01
    && any_of(char_offset(0xAD4), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xAD4), 
    format="SECS", lower_is_better=true, id=3
)

leaderboard(
    title = "Ruthless Ridge", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 02
    && any_of(char_offset(0xB44), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB44), 
    format="SECS", lower_is_better=true, id=4
)

leaderboard(
    title = "Intimidator", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 03
    && any_of(char_offset(0xB4C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB4C), 
    format="SECS", lower_is_better=true, id=5
)

leaderboard(
    title = "Ruthless - Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 15
    && any_of(char_offset(0xB14), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB14), 
    format="SECS", lower_is_better=true, id=6
)

leaderboard(
    title = "Peak 2 Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 01
    && any_of(char_offset(0xADC), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xADC), 
    format="SECS", lower_is_better=true, id=7
)

leaderboard(
    title = "Gravitude", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 04
    && any_of(char_offset(0xB54), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB54), 
    format="SECS", lower_is_better=true, id=8
)

leaderboard(
    title = "The Throne - Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 16
    && any_of(char_offset(0xB24), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB24), 
    format="SECS", lower_is_better=true, id=9
)

leaderboard(
    title = "All Peak Race", description = "Quickest time in conquer the mountain", start = no_cheating() && area() == 01
    && any_of(char_offset(0xAE4), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xAE4), 
    format="SECS", lower_is_better=true, id=10
)

leaderboard(
    title = "R&B", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 05
    && any_of(char_offset(0xB5C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB5C), 
    format="VALUE", lower_is_better=false, id=11
)

leaderboard(
    title = "Crow's Nest", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 08
    && any_of(char_offset(0xB74), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB74), 
    format="VALUE", lower_is_better=false, id=12
)

leaderboard(
    title = "The Junction", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 11
    && any_of(char_offset(0xB8C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB8C), 
    format="VALUE", lower_is_better=false, id=13
)

leaderboard(
    title = "Happiness Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 14
    && any_of(char_offset(0xB0C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB0C), 
    format="VALUE", lower_is_better=false, id=14
)

leaderboard(
    title = "Peak 1 Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 05
    && any_of(char_offset(0xAEC), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xAEC), 
    format="VALUE", lower_is_better=false, id=15
)

leaderboard(
    title = "Style Mile", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 06
    && any_of(char_offset(0xB64), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB64), 
    format="VALUE", lower_is_better=false, id=16
)

leaderboard(
    title = "Launch Time", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 09
    && any_of(char_offset(0xB7C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB7C), 
    format="VALUE", lower_is_better=false, id=17
)

leaderboard(
    title = "Schizophrenia", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 12
    && any_of(char_offset(0xB94), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB94), 
    format="VALUE", lower_is_better=false, id=18
)

leaderboard(
    title = "Ruthless Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 15
    && any_of(char_offset(0xB1C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB1C), 
    format="VALUE", lower_is_better=false, id=19
)

leaderboard(
    title = "Peak 2 Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 06
    && any_of(char_offset(0xAF4), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xAF4), 
    format="VALUE", lower_is_better=false, id=20
)

leaderboard(
    title = "Kick Doubt", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 07
    && any_of(char_offset(0xB6C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB6C), 
    format="VALUE", lower_is_better=false, id=21
)

leaderboard(
    title = "Much-2-Much", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 10
    && any_of(char_offset(0xB84), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB84), 
    format="VALUE", lower_is_better=false, id=22
)

leaderboard(
    title = "Perpendiculous", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 13
    && any_of(char_offset(0xB9C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB9C), 
    format="VALUE", lower_is_better=false, id=23
)

leaderboard(
    title = "Throne Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 16
    && any_of(char_offset(0xB2C), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xB2C), 
    format="VALUE", lower_is_better=false, id=24
)

leaderboard(
    title = "All-Peak Jam", description = "Highest score in conquer the mountain", start = no_cheating() && area() == 01
    && any_of(char_offset(0xAFC), a => dword(a) != prev(dword(a))), 
    cancel = 1 == 0, submit = 1 == 1, value = current_char_dword(0xAFC), 
    format="VALUE", lower_is_better=false, id=25
)