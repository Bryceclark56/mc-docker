### # # # # # # # # # # # # # # # # # # # # # # # # # # # ###
# Ensures server .jar exists and is of the correct version. #
#  If it does not exists, downloads it.                     #
#                                                           #
# Accepts an optional single argument consisting of         #
#  a Minecraft version string.                              #
### # # # # # # # # # # # # # # # # # # # # # # # # # # # ###

# If arg="latest" or empty, query mojang server for latest release version

# Check that version is valid (If previous step was skipped)

# If correct .jar file exists, exit
#  otherwise, query for .jar from Mojang and download it.