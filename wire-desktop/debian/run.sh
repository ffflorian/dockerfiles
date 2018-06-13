#!/usr/bin/env bash

set -e

SCRIPT_NAME="${0##*/}"

_print_usage() {
cat <<EOF
Usage: ${SCRIPT_NAME} [-r <repository>] [-b <branch>]

Switches:
 --repository (-r)   Use a different repository instead of the default one
 --branch     (-b)   Use a different branch instead of the default one
EOF
}

if [ -f "/.dockerenv" ]; then
  echo "Cloning from ${REPOSITORY} ..."

  git clone -q "${REPOSITORY}" "wire-desktop"
  cd "wire-desktop"

  if [ ! -z "${BRANCH}" ]; then
    git checkout "${BRANCH}"
  fi

  npm install --unsafe-perm
  npm run build:linux
else
  while (( ${#} )); do
    case "${1}" in
      -r|--repository )
        export REPOSITORY="${2}"
        shift 2
        ;;
      -b|--branch )
        export BRANCH="${2}"
        shift 2
        ;;
      "" )
        break
        ;;
      -* )
        echo "Unknown command '${1}'!"
        _print_usage
        exit 1
        ;;
    esac
  done

  if [ -z "${REPOSITORY}" ]; then
    REPOSITORY="https://github.com/wireapp/wire-desktop.git"
  fi

  CONTAINER_NAME="wire-desktop-debian"

  if [ ! "$(docker ps -a | grep ${CONTAINER_NAME})" ]; then
    docker build -t "${CONTAINER_NAME}" .
    docker run --name "${CONTAINER_NAME}" -e REPOSITORY="${REPOSITORY}" -e BRANCH="${BRANCH}" "${CONTAINER_NAME}" "/run.sh"
  fi
  docker start "${CONTAINER_NAME}"
  docker cp "${CONTAINER_NAME}:/wire-desktop/wrap/dist/." "./dist/"
fi
