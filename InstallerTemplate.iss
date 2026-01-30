; ===========================
;  UNIVERSAL INNO SETUP TEMPLATE
;  - Copy/paste for any app
;  - Only change the #define values below
; ===========================

; ----------- EDIT ONLY THESE 5 LINES -----------
#define AppName        "PerformSwitch"                 ; <-- (1) App naam
#define AppVersion     "2.0.0"                         ; <-- (2) Versie
#define AppPublisher   "WebDec"                        ; <-- (3) Publisher/Author
#define AppExeName     "PerformSwitch.exe"             ; <-- (4) Jouw hoofd .exe naam
#define SourceDir      "C:\Users\webdec\Desktop\App"   ; <-- (5) Map met publish/build output (exe + dll + assets)
; -----------------------------------------------

; OPTIONAL: icon file name inside SourceDir
#define AppIconFile    "PFS.ico"                       ; <-- (6) Icoon bestand (moet in SourceDir zitten)

; OPTIONAL: install folder name (meestal AppName is ok)
#define InstallFolderName AppName

[Setup]
; Unieke AppId: laat dit staan per app, of verander het voor elke nieuwe app
; Tip: voor nieuwe app -> Tools > Generate GUID in Inno Setup
AppId={{B8B7D4A9-5E5D-4D31-9A6B-0B9C9D7C2A11}}         ; <-- (OPTIONEEL) verander per app/project

AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}

; ✅ Per-user install (geen admin nodig) - werkt bijna altijd bij vrienden
DefaultDirName={localappdata}\{#InstallFolderName}
PrivilegesRequired=lowest

DefaultGroupName={#AppName}

; Waar je Setup.exe wordt gemaakt (zelfde folder als je publish output)
OutputDir={#SourceDir}
OutputBaseFilename={#AppName}_Setup

Compression=lzma
SolidCompression=yes
WizardStyle=modern

; Installer icoon (moet bestaan)
SetupIconFile={#SourceDir}\{#AppIconFile}

; Control Panel / Apps & Features icoon (neemt icon uit exe)
UninstallDisplayName={#AppName}
UninstallDisplayIcon={app}\{#AppExeName},0

[Tasks]
; Desktop shortcut (optioneel)
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

; Auto-start (optioneel) - standaard aangevinkt 1 keer
Name: "startup"; Description: "Start {#AppName} with &Windows"; GroupDescription: "Startup:"; Flags: checkedonce

[Files]
; ✅ Kopieer ALLES uit SourceDir naar install folder (exe/dll/png/ico/whatever)
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
; Startmenu shortcut
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"; IconFilename: "{app}\{#AppIconFile}"

; Desktop shortcut (optioneel)
Name: "{userdesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; IconFilename: "{app}\{#AppIconFile}"; Tasks: desktopicon

; Auto-start met Windows (per gebruiker)
Name: "{userstartup}\{#AppName}"; Filename: "{app}\{#AppExeName}"; IconFilename: "{app}\{#AppIconFile}"; Tasks: startup

[Run]
; Start app na installatie (optioneel)
Filename: "{app}\{#AppExeName}"; Description: "Launch {#AppName}"; Flags: nowait postinstall skipifsilent
