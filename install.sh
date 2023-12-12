
#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "This script shouldn't be run as root."
    exit 1
fi

chmod +x ./scripts/config.sh
chmod +x ./scripts/packages.sh
chmod +x ./scripts/tweaks.sh
chmod +x ./scripts/audio.sh

./scripts/packages.sh
./scripts/config.sh
./scripts/tweaks.sh
./scripts/audio.sh

