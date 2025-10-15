#!/bin/bash

# Returns "Not OK" if the provided date (format: YYYY-MM-DD) is more than 2 months ago,
# or if two version numbers are provided and they are different. Otherwise, returns "OK".
validate() {
    input_date="$1"
    version1="$2"
    version2="$3"
    input_sec=$(date -j -f "%Y-%m-%d" "$input_date" "+%s" 2>/dev/null)
    two_months_ago_sec=$(date -v-2m "+%s")
    if [ -z "$version1" ] || [ -z "$version2" ]; then
        # If one of the versions is not provided, it's Not OK
        echo "Not OK"
    elif [ "$version1" != "$version2" ]; then
        # If the versions are different, it's Not OK
        echo "Not OK"
    elif [ "$input_sec" -lt "$two_months_ago_sec" ]; then
        # If the date is more than 2 months ago, it's Not OK
        echo "Not OK"
    else
        # If the date is within 2 months and versions match, it's OK
        echo "OK"
    fi
}

getLogInfo () {
    latest_version=$(cat /var/log/Installomator.log | grep ": $1 : Latest version of" | tail -1 | awk '{print $NF}')
    if [ -z "$latest_version" ]; then
        latest_version="Unknown"
    fi
    echo "$latest_version"
}

# $1 = app path, $2 = label, $3 = version key (default: CFBundleShortVersionString), $4 = name key (default: CFBundleName)
getInfo () {
    infoFile="$1/Contents/Info.plist"
    versionKey=${3:-CFBundleShortVersionString}
    nameKey=${4:-CFBundleName}
    if [ -f "$infoFile" ]; then
        applicationName=$(defaults read "$infoFile" "$nameKey")
        installedVersion=$(defaults read "$infoFile" "$versionKey")
        modifiedDate=$(date -r "$infoFile" "+%Y-%m-%d")
        latestVersion=$(getLogInfo "$2")
        flag=$(validate "$modifiedDate" "$latestVersion" "$installedVersion")
        echo "$2;$latestVersion;$installedVersion;$modifiedDate;$flag"
    else
        echo "$1 not found"
    fi
}

if [ $# -eq 0 ]
then
    # No arguments supplied, read from Labels.txt. Ignore lines starting with #.
    echo "No arguments supplied"
    fileItemString=$(grep -v '^#' ./Auto-App-Test/Labels.txt | tr "\n" " ")
    labels=($fileItemString)
else
    label=$1
    # lowercase the label
    label=${label:l}
    labels=$label
fi

echo "Application;Latest Version;Installed Version;Date;Flag"

for label in "${labels[@]}"
do
    case $label in

        adobereaderdc)
        installationPath="/Applications/Adobe Acrobat Reader.app"
        getInfo "$installationPath" "adobereaderdc"
        ;;

        anydesk)
        installationPath="/Applications/AnyDesk.app"
        getInfo "$installationPath" "anydesk"
        ;;

        audacity)
        installationPath="/Applications/Audacity.app"
        getInfo "$installationPath" "audacity"
        ;;

        blender)
        installationPath="/Applications/Blender.app"
        getInfo "$installationPath" "blender"
        ;;

        calibriteprofiler)
        installationPath="/Applications/calibrite PROFILER.app"
        getInfo "$installationPath" "calibriteprofiler"
        ;;

        clickshare)
        installationPath="/Applications/ClickShare.app"
        getInfo "$installationPath" "clickshare"
        ;;

        bbedit)
        installationPath="/Applications/BBEdit.app"
        getInfo "$installationPath" "bbedit"
        ;;

        bitwarden)
        installationPath="/Applications/Bitwarden.app"
        getInfo "$installationPath" "bitwarden"
        ;;

        brave)
        installationPath="/Applications/Brave Browser.app"
        getInfo "$installationPath" "brave" "CFBundleVersion"
        ;;

        caffeine)
        installationPath="/Applications/Caffeine.app"
        getInfo "$installationPath" "caffeine"
        ;;

        canva)
        installationPath="/Applications/Canva.app"
        getInfo "$installationPath" "canva"
        ;;

        chatgpt)
        installationPath="/Applications/ChatGPT.app"
        getInfo "$installationPath" "chatgpt"
        ;;

        cinema4d)
        installationPath="/Applications/Maxon Cinema 4D 2025/Cinema 4D.app"
        getInfo "$installationPath" "cinema4d"
        ;;

        citrixworkspace)
        installationPath="/Applications/Citrix Workspace.app"
        getInfo "$installationPath" "citrixworkspace"
        ;;

        connectfonts)
        installationPath="/Applications/Connect Fonts.app"
        getInfo "$installationPath" "connectfonts"
        ;;

        adobecreativeclouddesktop)
        installationPath="/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
        getInfo "$installationPath" "adobecreativeclouddesktop"
        ;;

        cyberduck)
        installationPath="/Applications/Cyberduck.app"
        getInfo "$installationPath" "cyberduck"
        ;;

        deepl)
        installationPath="/Applications/DeepL.app"
        getInfo "$installationPath" "deepl"
        ;;

        discord)
        installationPath="/Applications/Discord.app"
        getInfo "$installationPath" "discord"
        ;;

        drawio)
        installationPath="/Applications/Draw.io.app"
        getInfo "$installationPath" "drawio"
        ;;

        dropbox)
        installationPath="/Applications/Dropbox.app"
        getInfo "$installationPath" "dropbox"
        ;;

        easyfind)
        installationPath="/Applications/Easyfind.app"
        getInfo "$installationPath" "easyfind"
        ;;

        elgatostreamdeck)
        installationPath="/Applications/Elgato Stream Deck.app"
        getInfo "$installationPath" "elgatostreamdeck"
        ;;

        figma)
        installationPath="/Applications/Figma.app"
        getInfo "$installationPath" "figma"
        ;;

        filemakerpro)
        installationPath="/Applications/FileMaker Pro.app"
        getInfo "$installationPath" "filemakerpro"
        ;;

        filezilla)
        installationPath="/Applications/FileZilla.app"
        getInfo "$installationPath" "filezilla"
        ;;

        firefoxpkg)
        installationPath="/Applications/Firefox.app"
        getInfo "$installationPath" "firefoxpkg"
        ;;

        gimp)
        installationPath="/Applications/GIMP.app"
        getInfo "$installationPath" "gimp"
        ;;

        githubdesktop)
        installationPath="/Applications/Github Desktop.app"
        getInfo "$installationPath" "githubdesktop"
        ;;

        gitkraken)
        installationPath="/Applications/GitKraken.app"
        getInfo "$installationPath" "gitkraken"
        ;;

        gotomeeting)
        installationPath="/Applications/GoToMeeting.app"
        getInfo "$installationPath" "gotomeeting"
        ;;

        googleearth)
        installationPath="/Applications/Google Earth Pro.app"
        getInfo "$installationPath" "googleearth"
        ;;

        googlechromepkg)
        installationPath="/Applications/Google Chrome.app"
        getInfo "$installationPath" "googlechromepkg"
        ;;

        googledrive)
        installationPath="/Applications/Google Drive.app"
        getInfo "$installationPath" "googledrive" "CFBundleVersion"
        ;;

        gpgsuite)
        installationPath="/Library/Application Support/GPGTools/GPGSuite_Updater.app"
        getInfo "$installationPath" "gpgsuite"
        ;;

        handbrake)
        installationPath="/Applications/HandBrake.app"
        getInfo "$installationPath" "handbrake"
        ;;

        imazingprofileeditor)
        installationPath="/Applications/iMazing Profile Editor.app"
        getInfo "$installationPath" "imazingprofileeditor"
        ;;

        inkscape)
        installationPath="/Applications/Inkscape.app"
        getInfo "$installationPath" "inkscape"
        ;;

        iterm2)
        installationPath="/Applications/iTerm.app"
        getInfo "$installationPath" "iterm2"
        ;;

        jetbrainsintellijideace)
        installationPath="/Applications/IntelliJ IDEA CE.app"
        getInfo "$installationPath" "jetbrainsintellijideace"
        ;;

        keka)
        installationPath="/Applications/Keka.app"
        getInfo "$installationPath" "keka"
        ;;

        lastpass)
        installationPath="/Applications/LastPass.app"
        getInfo "$installationPath" "lastpass"
        ;;

        logitechoptionsplus)
        installationPath="/Applications/Logi Options+.app"
        getInfo "$installationPath" "logitechoptionsplus"
        ;;

        maxonapp)
        installationPath="/Applications/Maxon.app"
        getInfo "$installationPath" "maxonapp"
        ;;

        microsoftautoupdate)
        installationPath="/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app"
        getInfo "$installationPath" "microsoftautoupdate"
        ;;

        microsoftcompanyportal)
        installationPath="/Applications/Company Portal.app"
        getInfo "$installationPath" "microsoftcompanyportal" "CFBundleVersion"
        ;;

        microsoftdefenderatp)
        installationPath="/Applications/Microsoft Defender.app"
        getInfo "$installationPath" "microsoftdefenderatp"
        ;;

        microsoftedge)
        installationPath="/Applications/Microsoft Edge.app"
        getInfo "$installationPath" "microsoftedge"
        ;;

        microsoftexcel)
        installationPath="/Applications/Microsoft Excel.app"
        getInfo "$installationPath" "microsoftexcel" "CFBundleVersion"
        ;;

        microsoftonedrive)
        installationPath="/Applications/OneDrive.app"
        getInfo "$installationPath" "microsoftonedrive"
        ;;

        microsoftonenote)
        installationPath="/Applications/Microsoft OneNote.app"
        getInfo "$installationPath" "microsoftonenote" "CFBundleVersion"
        ;;

        microsoftoutlook)
        installationPath="/Applications/Microsoft Outlook.app"
        getInfo "$installationPath" "microsoftoutlook" "CFBundleVersion"
        ;;

        microsoftpowerpoint)
        installationPath="/Applications/Microsoft PowerPoint.app"
        getInfo "$installationPath" "microsoftpowerpoint" "CFBundleVersion"
        ;;

        microsoftteamsclassic)
        installationPath="/Applications/Microsoft Teams Classic.app"
        getInfo "$installationPath" "microsoftteamsclassic"
        ;;

        microsoftteamsnew)
        installationPath="/Applications/Microsoft Teams.app"
        getInfo "$installationPath" "microsoftteamsnew"
        ;;

        microsoftwindowsapp)
        installationPath="/Applications/Windows app.app"
        getInfo "$installationPath" "microsoftwindowsapp"
        ;;

        microsoftword)
        installationPath="/Applications/Microsoft Word.app"
        getInfo "$installationPath" "microsoftword" "CFBundleVersion"
        ;;

        miro)
        installationPath="/Applications/Miro.app"
        getInfo "$installationPath" "miro"
        ;;

        nextcloud)
        installationPath="/Applications/Nextcloud.app"
        getInfo "$installationPath" "nextcloud" "CFBundleShortVersionString" "CFBundleExecutable"
        ;;

        nodejs)
        installedVersion=$(node --version | tr -d 'v')
        modifiedDate=$(date -r "/usr/local/bin/node" "+%Y-%m-%d")
        latestVersion=$(getLogInfo "nodejs")
        flag=$(validate "$modifiedDate" "$latestVersion" "$installedVersion")
        echo "nodejs;$latestVersion;$installedVersion;$modifiedDate;$flag"
        ;;

        nomad)
        installationPath="/Applications/NoMAD.app"
        getInfo "$installationPath" "nomad"
        ;;

        obs)
        installationPath="/Applications/obs.app"
        getInfo "$installationPath" "obs"
        ;;

        onyX)
        installationPath="/Applications/onyX.app"
        getInfo "$installationPath" "onyX"
        ;;

        pgadmin4)
        installationPath="/Applications/pgAdmin 4.app"
        getInfo "$installationPath" "pgadmin4"
        ;;

        postman)
        installationPath="/Applications/Postman.app"
        getInfo "$installationPath" "postman"
        ;;

        pycharmce)
        installationPath="/Applications/PyCharm CE.app"
        getInfo "$installationPath" "pycharmce"
        ;;

        rapidapi)
        installationPath="/Applications/RapidAPI.app"
        getInfo "$installationPath" "rapidapi"
        ;;

        r)
        installedVersion=$(R --version | head -n 1 | cut -d ' ' -f3)
        modifiedDate=$(R --version | head -n 1 | cut -d ' ' -f4 | tr -d '(' | tr -d ')')
        latestVersion=$(getLogInfo "r")
        flag=$(validate "$modifiedDate" "$latestVersion" "$installedVersion")
        echo "r;$latestVersion;$installedVersion;$modifiedDate;$flag"
        ;;

        rstudio)
        installationPath="/Applications/RStudio.app"
        getInfo "$installationPath" "rstudio"
        ;;

        rodecentral)
        installationPath="/Applications/RODE central.app"
        getInfo "$installationPath" "rodecentral"
        ;;

        signal)
        installationPath="/Applications/Signal.app"
        getInfo "$installationPath" "signal"
        ;;

        sketchupviewer)
        installationPath="/Applications/SketchUpViewer.app"
        getInfo "$installationPath" "sketchupviewer"
        ;;

        slack)
        installationPath="/Applications/Slack.app"
        getInfo "$installationPath" "slack"
        ;;

        spotify)
        installationPath="/Applications/Spotify.app"
        getInfo "$installationPath" "spotify"
        ;;

        dialog)
        installedVersion=$(/usr/local/bin/dialog -v)
        modifiedDate=$(date -r "/usr/local/bin/dialog" "+%Y-%m-%d")
        latestVersion=$(getLogInfo "dialog")
        flag=$(validate "$modifiedDate" "$latestVersion" "$installedVersion")
        echo "swiftdialog;$latestVersion;$installedVersion;$modifiedDate;$flag"
        ;;

        teamviewer)
        installationPath="/Applications/TeamViewer.app"
        getInfo "$installationPath" "teamviewer"
        ;;

        pcoipclient)
        installationPath="/Applications/PCoIPClient.app"
        getInfo "$installationPath" "pcoipclient"
        ;;

        privileges2)
        installationPath="/Applications/privileges.app"
        getInfo "$installationPath" "privileges2"
        ;;

        textmate)
        installationPath="/Applications/TextMate.app"
        getInfo "$installationPath" "textmate"
        ;;

        theunarchiver)
        installationPath="/Applications/The Unarchiver.app"
        getInfo "$installationPath" "theunarchiver"
        ;;

        thunderbird)
        installationPath="/Applications/Thunderbird.app"
        getInfo "$installationPath" "thunderbird"
        ;;

        ultimakercura)
        installationPath="/Applications/UltiMaker Cura.app"
        getInfo "$installationPath" "ultimakercura"
        ;;

        microsoftvisualstudiocode)
        installationPath="/Applications/Visual Studio Code.app"
        getInfo "$installationPath" "microsoftvisualstudiocode"
        ;;

        vlc)
        installationPath="/Applications/VLC.app"
        getInfo "$installationPath" "vlc"
        ;;

        wacomdrivers)
        installationPath="/Applications/Wacom Tablet.localized/Wacom Center.app"
        getInfo "$installationPath" "wacomdrivers"
        ;;

        whatsapp)
        installationPath="/Applications/WhatsApp.app"
        getInfo "$installationPath" "whatsapp"
        ;;

        zoom)
        installationPath="/Applications/Zoom.us.app"
        getInfo "$installationPath" "zoom" "CFBundleVersion"
        ;;

        *)
        echo "Label $label not found"
        ;;

        esac
done
