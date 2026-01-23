#!/usr/bin/env bash

# Read secret string from https://stackoverflow.com/questions/3980668/how-to-get-a-password-from-a-shell-script-without-echoing

read_secret()
{
    # Set up trap to ensure echo is enabled before exiting if the script
    # is terminated while echo is disabled.
    trap 'stty echo' EXIT

    # Disable echo.
    stty -echo

    # Read secret.
    read "$@"

    # Enable echo.
    stty echo
    trap - EXIT

    # Print a newline because the newline entered by the user after
    # entering the passcode is not echoed. This ensures that the
    # next line of output begins at a new line.
    echo
}

printf "Password: "
read_secret pw

echo "$pw"