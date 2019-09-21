#!/bin/sh

option=$(printf "Shutdown\nReboot\nHibernate\nSuspend\nLogout\nNevermind" | dmenu -i -p "What do you want to do?")
confirm="sh $SCRIPTS/confirm.sh"

case $option in
	"Shutdown")
		$confirm "Are you sure you want to shutdown now?" && systemctl poweroff ;;
	"Reboot")
		$confirm "Are you sure you want to reboot?" && systemctl reboot ;;
	"Hibernate")
		$confirm "Are you sure you want to hibernate?" && systemctl hibernate ;;
	"Suspend")
		$confirm "Are you sure you want to suspend" && systemctl suspend ;;
	"Logout")
		$confirm "Are you sure you want to end your session" && i3-msg exit ;;
	*)
		exit 1 ;;
esac
