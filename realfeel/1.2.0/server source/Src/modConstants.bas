Attribute VB_Name = "modConstants"
'****************************************************************
'* WHEN        WHO        WHAT
'* ----        ---        ----
'* 07/16/2005  Shannara   Created module.
'****************************************************************

Option Explicit

Public Const GAME_WEBSITE = "http://www.dualsolace.com"
'Public Const GAME_NAME = "Dual Solace"

Public Const ADMIN_LOG = "admin.log"
Public Const PLAYER_LOG = "player.log"

' Version constants
Public Const CLIENT_MAJOR = 1
Public Const CLIENT_MINOR = 2
Public Const CLIENT_REVISION = 0
Public Const Quote = """"

Public Const MAX_LINES = 500

Public Const Black = 0
Public Const Blue = 1
Public Const Green = 2
Public Const Cyan = 3
Public Const Red = 4
Public Const Magenta = 5
Public Const Brown = 6
Public Const Grey = 7
Public Const DarkGrey = 8
Public Const BrightBlue = 9
Public Const BrightGreen = 10
Public Const BrightCyan = 11
Public Const BrightRed = 12
Public Const Pink = 13
Public Const Yellow = 14
Public Const White = 15

Public Const SayColor = Grey
Public Const GlobalColor = BrightBlue
Public Const BroadcastColor = Pink
Public Const TellColor = BrightGreen
Public Const EmoteColor = BrightCyan
Public Const AdminColor = BrightCyan
Public Const HelpColor = Pink
Public Const WhoColor = Pink
Public Const JoinLeftColor = DarkGrey
Public Const NpcColor = Brown
Public Const AlertColor = Red
Public Const NewMapColor = Pink

' General constants
'Public Const GAME_NAME = "Dual Solace Engine"
'Public Const MAX_PLAYERS = 70
'Public Const MAX_ITEMS = 255
'Public Const MAX_NPCS = 255
Public Const MAX_INV = 20
Public Const MAX_MAP_ITEMS = 20
Public Const MAX_MAP_NPCS = 8
'Public Const MAX_SHOPS = 255
Public Const MAX_PLAYER_SPELLS = 20
'Public Const MAX_SPELLS = 255
Public Const MAX_TRADES = 8
'Public Const MAX_GUILDS = 20
Public Const MAX_GUILD_MEMBERS = 10
Public Const MAX_NPC_SPELLS = 5
Public Const MAX_BANK_ITEMS = 40

Public Const NO = 0
Public Const YES = 1

' Account constants
Public Const NAME_LENGTH = 20
Public Const MAX_CHARS = 3

' Sex constants
Public Const SEX_MALE = 0
Public Const SEX_FEMALE = 1

' Map constants
'Public Const MAX_MAPS = 1000
Public Const MAX_MAPX = 22
Public Const MAX_MAPY = 15
Public Const MAP_MORAL_NONE = 0
Public Const MAP_MORAL_SAFE = 1

' Image constants
Public Const PIC_X = 32
Public Const PIC_Y = 32

' Tile consants
Public Const TILE_TYPE_WALKABLE = 0
Public Const TILE_TYPE_BLOCKED = 1
Public Const TILE_TYPE_WARP = 2
Public Const TILE_TYPE_ITEM = 3
Public Const TILE_TYPE_NPCAVOID = 4
Public Const TILE_TYPE_KEY = 5
Public Const TILE_TYPE_KEYOPEN = 6
Public Const TILE_TYPE_NORTH = 7
Public Const TILE_TYPE_WEST = 8
Public Const TILE_TYPE_EAST = 9
Public Const TILE_TYPE_SOUTH = 10
Public Const TILE_TYPE_SHOP = 11
Public Const TILE_TYPE_BANK = 12
Public Const TILE_TYPE_HEAL = 13
Public Const TILE_TYPE_DAMAGE = 14

' Item constants
Public Const ITEM_TYPE_NONE = 0
Public Const ITEM_TYPE_WEAPON = 1
Public Const ITEM_TYPE_ARMOR = 2
Public Const ITEM_TYPE_HELMET = 3
Public Const ITEM_TYPE_SHIELD = 4
Public Const ITEM_TYPE_POTIONADDHP = 5
Public Const ITEM_TYPE_POTIONADDMP = 6
Public Const ITEM_TYPE_POTIONADDSP = 7
Public Const ITEM_TYPE_POTIONSUBHP = 8
Public Const ITEM_TYPE_POTIONSUBMP = 9
Public Const ITEM_TYPE_POTIONSUBSP = 10
Public Const ITEM_TYPE_KEY = 11
Public Const ITEM_TYPE_CURRENCY = 12
Public Const ITEM_TYPE_SPELL = 13

'Item Type Constants
Public Const WEAPON_TYPE_BOW = 1
Public Const SHIELD_TYPE_ARROW = 2

'Breakable?
Public Const UNBREAKABLE = 1

' Direction constants
Public Const DIR_UP = 0
Public Const DIR_DOWN = 1
Public Const DIR_LEFT = 2
Public Const DIR_RIGHT = 3

' Constants for player movement
Public Const MOVING_WALKING = 1
Public Const MOVING_RUNNING = 2

' Weather constants
Public Const WEATHER_NONE = 0
Public Const WEATHER_RAINING = 1
Public Const WEATHER_SNOWING = 2

' Time constants
Public Const TIME_DAY = 0
Public Const TIME_NIGHT = 1

' Admin constants
Public Const ADMIN_MONITER = 1
Public Const ADMIN_MAPPER = 2
Public Const ADMIN_DEVELOPER = 3
Public Const ADMIN_CREATOR = 4

' NPC constants
Public Const NPC_BEHAVIOR_ATTACKONSIGHT = 0
Public Const NPC_BEHAVIOR_ATTACKWHENATTACKED = 1
Public Const NPC_BEHAVIOR_FRIENDLY = 2
Public Const NPC_BEHAVIOR_SHOPKEEPER = 3
Public Const NPC_BEHAVIOR_GUARD = 4

'New NPC constants
Public Const NPC_BEHAVIOR_FOLLOW = 5 'Follows a target
Public Const NPC_BEHAVIOR_TRAITOR = 6 'Attacks other npcs

' Spell constants
Public Const SPELL_TYPE_ADDHP = 0
Public Const SPELL_TYPE_ADDMP = 1
Public Const SPELL_TYPE_ADDSP = 2
Public Const SPELL_TYPE_SUBHP = 3
Public Const SPELL_TYPE_SUBMP = 4
Public Const SPELL_TYPE_SUBSP = 5
Public Const SPELL_TYPE_GIVEITEM = 6

' Target type constants
Public Const TARGET_TYPE_PLAYER = 0
Public Const TARGET_TYPE_NPC = 1

'Edit constants
Public Const EDIT_SERVERMESSAGE = 0
Public Const EDIT_SCRIPT = 1
Public Const EDIT_OTHER = 2

'Constant for Player Friends
Public Const MAX_FRIENDS = 5

'Constant for Player Trackers
Public Const MAX_TRACKERS = 3

'Shop time constants
Public Const TIME_MINUTE = 60000
Public Const TIME_HOUR = 3600000
Public Const TIME_FULL = 86400000

'Constants required by Shell_NotifyIcon API call
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4
Public Const WM_MOUSEMOVE = &H200
Public Const WM_LBUTTONDOWN = &H201     'Button down
Public Const WM_LBUTTONUP = &H202 'Button up
Public Const WM_LBUTTONDBLCLK = &H203   'Double-click
Public Const WM_RBUTTONDOWN = &H204     'Button down
Public Const WM_RBUTTONUP = &H205 'Button up
Public Const WM_RBUTTONDBLCLK = &H206   'Double-click
