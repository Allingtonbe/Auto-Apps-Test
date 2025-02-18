#!/bin/bash

getInfo () {
    infoFile="$1/Contents/Info.plist"
    if [ -f "$infoFile" ]; then
        applicationName=$(defaults read "$infoFile" CFBundleName)
        installedVersion=$(defaults read "$infoFile" CFBundleShortVersionString)
        modifiedDate=$(date -r "$infoFile" "+%Y-%m-%d")
        echo "$applicationName;$installedVersion;$modifiedDate"
    else
        echo "$1;-;-"
    fi
}

echo "Application;Version;Date"

#adobereaderdc
installationPath="/Applications/Adobe Acrobat Reader.app"
getInfo "$installationPath"

#anydesk
installationPath="/Applications/AnyDesk.app"
getInfo "$installationPath"

#audacity
installationPath="/Applications/Audacity.app"
getInfo "$installationPath"

#clickshare
installationPath="/Applications/ClickShare.app"
getInfo "$installationPath"

#bbedit
installationPath="/Applications/BBEdit.app"
getInfo "$installationPath"

#bitwarden
installationPath="/Applications/Bitwarden.app"
getInfo "$installationPath"

#brave
installationPath="/Applications/Brave Browser.app"
getInfo "$installationPath"

#caffeine
installationPath="/Applications/Caffeine.app"
getInfo "$installationPath"

#canva
installationPath="/Applications/Canva.app"
getInfo "$installationPath"

#cinema4d
installationPath="/Applications/Maxon Cinema 4D 2024/Cinema 4D.app"
getInfo "$installationPath"

#citrixworkspace
installationPath="/Applications/Citrix Workspace.app"
getInfo "$installationPath"

#connectfonts
installationPath="/Applications/Connect Fonts.app"
getInfo "$installationPath"

#adobecreativeclouddesktop
installationPath="/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
getInfo "$installationPath"

#cyberduck
installationPath="/Applications/Cyberduck.app"
getInfo "$installationPath"

#deepl
installationPath="/Applications/DeepL.app"
getInfo "$installationPath"

#discord
installationPath="/Applications/Discord.app"
getInfo "$installationPath"

#drawio
installationPath="/Applications/Draw.io.app"
getInfo "$installationPath"

#dropbox
installationPath="/Applications/Dropbox.app"
getInfo "$installationPath"

#easyfind
installationPath="/Applications/Easyfind.app"
getInfo "$installationPath"

#figma
installationPath="/Applications/Figma.app"
getInfo "$installationPath"

#filezilla
installationPath="/Applications/FileZilla.app"
getInfo "$installationPath"

#firefox
installationPath="/Applications/Firefox.app"
getInfo "$installationPath"

#gimp
installationPath="/Applications/GIMP.app"
getInfo "$installationPath"

#github
installationPath="/Applications/Github Desktop.app"
getInfo "$installationPath"

#gitkraken
installationPath="/Applications/GitKraken.app"
getInfo "$installationPath"

#gotomeeting
installationPath="/Applications/GoToMeeting.app"
getInfo "$installationPath"

#googlechromepkg
installationPath="/Applications/Google Chrome.app"
getInfo "$installationPath"

#googledrive
installationPath="/Applications/Google Drive.app"
getInfo "$installationPath"

#gpgsuite
installationPath="/Library/Application Support/GPGTools/GPGSuite_Updater.app"
getInfo "$installationPath"

#handbrake
installationPath="/Applications/HandBrake.app"
getInfo "$installationPath"

#imazingprofileeditor
installationPath="/Applications/iMazing Profile Editor.app"
getInfo "$installationPath"

#inkscape
installationPath="/Applications/Inkscape.app"
getInfo "$installationPath"

#iterm2
installationPath="/Applications/iTerm.app"
getInfo "$installationPath"

#jetbrainsintellijideace
installationPath="/Applications/IntelliJ IDEA CE.app"
getInfo "$installationPath"

#keka
installationPath="/Applications/Keka.app"
getInfo "$installationPath"

#lastpass
installationPath="/Applications/LastPass.app"
getInfo "$installationPath"

#logioptionsplus
installationPath="/Applications/logioptionsplus.app"
getInfo "$installationPath"

#microsoftautoupdate
installationPath="/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app"
getInfo "$installationPath"

#microsoftcompanyportal
installationPath="/Applications/Company Portal.app"
getInfo "$installationPath"

#microsoftdefenderatp
installationPath="/Applications/Microsoft Defender.app"
getInfo "$installationPath"

#microsoftedge
installationPath="/Applications/Microsoft Edge.app"
getInfo "$installationPath"

#microsoftexcel
installationPath="/Applications/Microsoft Excel.app"
getInfo "$installationPath"

#microsoftonedrive
installationPath="/Applications/OneDrive.app"
getInfo "$installationPath"

#microsoftonenote
installationPath="/Applications/Microsoft OneNote.app"
getInfo "$installationPath"

#microsoftoutlook
installationPath="/Applications/Microsoft Outlook.app"
getInfo "$installationPath"

#microsoftpowerpoint
installationPath="/Applications/Microsoft PowerPoint.app"
getInfo "$installationPath"

#microsoftremotedesktop
installationPath="/Applications/Microsoft Remote Desktop.app"
getInfo "$installationPath"

#microsoftteamsclassic
installationPath="/Applications/Microsoft Teams Classic.app"
getInfo "$installationPath"

#microsoftteamsnew
installationPath="/Applications/Microsoft Teams.app"
getInfo "$installationPath"

#microsoftword
installationPath="/Applications/Microsoft Word.app"
getInfo "$installationPath"

#miro
installationPath="/Applications/Miro.app"
getInfo "$installationPath"

#nextcloud
installationPath="/Applications/Nextcloud.app"
installedVersion=$(defaults read "$installationPath/Contents/Info.plist" CFBundleShortVersionString)
modifiedDate=$(date -r "$installationPath/Contents/Info.plist" "+%Y-%m-%d")
echo "Nextcloud; $installedVersion; $modifiedDate"

#nodejs
installedVersion=$(node --version | tr -d 'v')
modifiedDate=$(date -r "/usr/local/bin/node" "+%Y-%m-%d")
echo "NodeJS;$installedVersion;$modifiedDate"

#pgadmin4
installationPath="/Applications/pgAdmin 4.app"
getInfo "$installationPath"

#postman
installationPath="/Applications/Postman.app"
getInfo "$installationPath"

#pycharmce
installationPath="/Applications/PyCharm CE.app"
getInfo "$installationPath"

#rapidapi
installationPath="/Applications/RapidAPI.app"
getInfo "$installationPath"

#r
installedVersion=$(R --version | head -n 1 | cut -d ' ' -f3)
modifiedDate=$(R --version | head -n 1 | cut -d ' ' -f4 | tr -d '(' | tr -d ')')
echo "R;$installedVersion;$modifiedDate"

#rstudio
installationPath="/Applications/RStudio.app"
getInfo "$installationPath"

#signal
installationPath="/Applications/Signal.app"
getInfo "$installationPath"

#sketchupviewer
installationPath="/Applications/SketchUpViewer.app"
getInfo "$installationPath"

#slack
installationPath="/Applications/Slack.app"
getInfo "$installationPath"

#spotify
installationPath="/Applications/Spotify.app"
getInfo "$installationPath"

#teamviewer
installationPath="/Applications/TeamViewer.app"
getInfo "$installationPath"

#pcoipclient
installationPath="/Applications/PCoIPClient.app"
getInfo "$installationPath"

#textmate
installationPath="/Applications/TextMate.app"
getInfo "$installationPath"

#theunarchiver
installationPath="/Applications/The Unarchiver.app"
getInfo "$installationPath"

#thunderbird
installationPath="/Applications/Thunderbird.app"
getInfo "$installationPath"

#visualstudiocode
installationPath="/Applications/Visual Studio Code.app"
getInfo "$installationPath"

#vlc
installationPath="/Applications/VLC.app"
getInfo "$installationPath"

#wacomdrivers
installationPath="/Applications/Wacom Tablet.localized/Wacom Center.app"
getInfo "$installationPath"

#whatsapp
installationPath="/Applications/WhatsApp.app"
getInfo "$installationPath"

#zoom
installationPath="/Applications/Zoom.us.app"
getInfo "$installationPath"
