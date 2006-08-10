#!/bin/sh
# $FreeBSD$

# PROVIDE: apache
# REQUIRE: DAEMON
# BEFORE: LOGIN
# KEYWORD: shutdown

# Define these apache_* variables in one of these files:
#       /etc/rc.conf
#       /etc/rc.conf.local
#       /etc/rc.conf.d/apache
#
# DO NOT CHANGE THESE DEFAULT VALUES HERE
#
apache_enable=${apache_enable-"NO"}
apache_flags=${apache_flags-""}
apache_pidfile=${apache_pidfile-"/var/run/httpd.pid"}

. %%RC_SUBR%%

name="apache"
rcvar=`set_rcvar`
command="%%PREFIX%%/sbin/httpd"

load_rc_config $name

pidfile="${apache_pidfile}"
start_precmd="`/usr/bin/limits -e -U www`"
start_postcmd="`/usr/bin/limits -e -C daemon`"

run_rc_command "$1"
