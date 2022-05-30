// SSX 3
// #ID = 2928
// MD5: 662c2c9772ef2943d4fdefa2c496a934

// $44C479: 24bit Actions Counter
//          (useful for preventing achievements popping up when loading the game)
function action_counter() => tbyte(0x44C479)

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

// $5305F9: 8bit Game Mode (sticky)
//          00 - Conquer The Mountain
//          01 - Single Event
//          02 - Multi Play
function game_mode() => byte(0x5305F9)

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
function character() => byte(0x534FF1)

// $87ABB0: 32bit Cheat Protection
//          Seems to consistantly be 0xffffffff when not in the title menus, some sort of counter
function game_state() => dword(0x87ABB0)

function no_cheating() => unless(action_counter() <= 1) && unless(game_state() != 0xffffffff)

//the address where each character's data starts
char_pointers = [moby_pointer(), kaori_pointer(), allegra_pointer(), mac_pointer(), zoe_pointer(), griff_pointer(), elise_pointer(), nate_pointer(), psymon_pointer(), viggo_pointer()]

//creates char_value which grabs the character data with the specified offset to the character pointer for each character
function char_offset(offset)
{
  char_value = []
  for item in char_pointers
  {
      array_push(char_value, byte(item + offset)) 
  }
  
  return char_value
} 

//1. Collect a snowflake at Happiness (2 points)

achievement(
    title = "Happy Little Snowflake", description = "Collect your first snowflake at Happiness", points = 2,
    trigger = no_cheating() && any_of(char_offset(0xAC), a => 0x01) && area() == 0x0e
)

//2. Win a medal at the Snow Jam race competition (3 points)
//3. Win a medal at the Junction freestyle competition (3 points)
//4. Complete the first BIG challenge at Crow's Nest (3 points)

