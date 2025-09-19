#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMG="$DIR/assets/img"
mkdir -p "$IMG"

UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
download () {
  local name="$1"
  local url="$2"
  echo "Downloading $name ..."
  curl -L -H "User-Agent: $UA" -H "Accept: */*" -e "https://unsplash.com/" -o "$IMG/$name" "$url"
}

download "hero.jpg"                "https://unsplash.com/photos/cKjaZ68gSrc/download?force=true"
download "service-design.jpg"      "https://unsplash.com/photos/m9qMoh-scfE/download?force=true"
download "service-supervision.jpg" "https://unsplash.com/photos/r5BOfNgTVxo/download?force=true"
download "service-construction.jpg" "https://unsplash.com/photos/xeF8HHExwHU/download?force=true"
download "service-green.jpg"       "https://unsplash.com/photos/73JOOymZQTQ/download?force=true"
download "about-bg.jpg"            "https://unsplash.com/photos/NxtKALyY6po/download?force=true"
download "offices-bg.jpg"          "https://unsplash.com/photos/866LKn6Uc-o/download?force=true"
echo "Done."
