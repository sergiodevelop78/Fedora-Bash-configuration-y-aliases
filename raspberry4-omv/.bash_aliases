alias lh='ls -lh'
alias lha='ls -lha'
alias reloadbc='source ~/.bashrc'

alias jellyfinStatus='sudo systemctl status jellyfin'
alias jellyfinRestart='sudo systemctl restart jellyfin'
alias jellyfinRev='sudo journalctl -u jellyfin -n 50 --no-pager'
alias jellyfinTime='sudo ps -C jellyfin -o pid,cmd,start,etimes,etime'


function jellyfinTiempo {
        servicestartsec=$(date -d "$(systemctl show --property=ActiveEnterTimestamp --value jellyfin)" +%s)
        segundos=$(( $(date +%s) - servicestartsec ))
        horas=$(date -u -d "@$segundos" +"%T")
        echo -e
        echo ">> Jellyfin service está corriendo por $segundos segundos o $horas horas."
        echo -e
}

function jellyfinFixLogFolder {
        sudo mkdir /var/log/jellyfin
        sudo mkdir /var/log/jellyfin_dummy
        sudo chown -R jellyfin:jellyfin /var/log/jellyfin


}
