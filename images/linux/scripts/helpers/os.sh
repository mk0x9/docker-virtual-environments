#!/bin/bash
################################################################################
##  File:  install-helpers.sh
##  Desc:  Helper functions for installing tools
################################################################################

function isUbuntu16
{
    lsb_release -d | grep -q 'Ubuntu 16'
}

function isUbuntu18
{
    lsb_release -d | grep -q 'Ubuntu 18'
}

function isUbuntu20
{
    lsb_release -d | grep -q 'Ubuntu 20'
}

function getOSVersionLabel
{
    lsb_release -cs
}

function isDocker
{
    if [ -f "/.dockerenv" ] ; then
	    return 0
    else
	    return 1
    fi
}

function disableServiceAutostart
{
    echo "disabling service autostart"

    if [ -f "/usr/sbin/policy-rc.d" ] ; then
        mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.unused
    fi
}

function enablingServiceAutostart
{
    echo "enabling service autostart"

    if [ -f "/usr/sbin/policy-rc.d.unused" ] ; then
        mv /usr/sbin/policy-rc.d.unused /usr/sbin/policy-rc.d
    fi
}
