#!/bin/sh

OPTION=`echo -e "Shutdown\nReboot\nHibernate\nSuspend\nLogout\nNevermind" | dmenu -i -p "What do you want to do?"`

# IT NEEDS A BETTER SOLUTION
CONFIRM=$HOME/.scripts/confirm.sh

case $OPTION in
	"Shutdown")
		$CONFIRM "Are you sure you want to shutdown now?" && systemctl poweroff ;;
	"Reboot")
		$CONFIRM "Are you sure you want to reboot?" && systemctl reboot ;;
	"Hibernate")
		$CONFIRM "Are you sure you want to hibernate?" && systemctl hibernate ;;
	"Suspend")
		$CONFIRM "Are you sure you want to suspend" && systemctl suspend ;;
	"Logout")
		$CONFIRM "Are you sure you want to end your session" && i3-msg exit ;;
	*)
		exit 1 ;;
esac
