#!/bin/bash

# Define the custom cd function
CD_FUNC='function cd {
    # change the directory with all args passed to the function
    builtin cd "$@"

    # if there is a regular file named ".nvmrc" it will run the nvm use command
    if [ -f "$PWD/.nvmrc" ] ; then
        nvm use
    fi
}'

# Add the custom cd function to ~/.bash_profile
echo "\n" >> ~/.bash_profile
echo "$CD_FUNC" >> ~/.bash_profile

# Add the command to source ~/.bash_profile to ~/.zshrc
echo '\nif [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi' >> ~/.zshrc
