#define MyAppName "NvUnboost"
#define MyAppVersion "1.0"
#define MyAppPublisher "narzoul"
#define MyAppURL "https://github.com/narzoul/NvUnboost"
#define MyAppExeName "NvUnboost.exe"

#include "InnoDependencyInstaller\CodeDependencies.iss"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{852898F8-5B87-48F4-B360-308C7246795F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
; "ArchitecturesAllowed=x64compatible" specifies that Setup cannot run
; on anything but x64 and Windows 11 on Arm.
ArchitecturesAllowed=x64compatible
; "ArchitecturesInstallIn64BitMode=x64compatible" requests that the
; install be done in "64-bit mode" on x64 or Windows 11 on Arm,
; meaning it should use the native 64-bit Program Files directory and
; the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName={#MyAppName}
PrivilegesRequired=admin
OutputBaseFilename=NvUnboost-setup
SolidCompression=yes
WizardStyle=modern
; Minimum: Windows 11 Version 24H2 (2024 Update)
MinVersion=10.0.26100

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "runadmintask"; Description: "Run {#MyAppName} with Administrator privilege"; Flags:unchecked
Name: "startupicon"; Description: "Run {#MyAppName} at Windows startup"; Flags: unchecked

[Files]
Source: "..\x64\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Flags: runminimized; Tasks: startupicon

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{commonpf64}\NvUnboost\NvUnboost.exe"; Flags: deletevalue; Tasks: not runadmintask;
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{commonpf64}\NvUnboost\NvUnboost.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue;Tasks: runadmintask;

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent;Tasks: not runadmintask;
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent runascurrentuser;Tasks: runadmintask;

[Code]

function InitializeSetup(): Boolean;
begin
  Dependency_AddVC2015To2022;
  Result := True;
end;
