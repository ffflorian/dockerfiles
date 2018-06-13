#!/usr/bin/env bash

set -e

SCRIPT_NAME="${0##*/}"

_print_usage() {
cat <<EOF
Usage: ${SCRIPT_NAME} <repository> [-b <branch>]

Switches:
 --branch (-b)   Use a different branch instead of the default one

Example: ${SCRIPT_NAME} https://github.com/ffflorian/ntpclient.git
EOF
}

if [ -f "/.dockerenv" ]; then
  TMP_DIR="$(mktemp -d -p .)"

  echo "Cloning from ${REPOSITORY} ..."

  git clone -q "${REPOSITORY}" "${TMP_DIR}"
  cd "${TMP_DIR}"

  if [ ! -z "${BRANCH}" ]; then
    git checkout "${BRANCH}"
  fi

  if [ -r "yarn.lock" ]; then
    yarn
    yarn test
  else
    npm install --unsafe-perm
    npm run test
  fi
else
  while (( ${#} )); do
    case "${1}" in
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
      * )
        export REPOSITORY="${1}"
        shift 1
        ;;
    esac
  done

  if [ -z "${REPOSITORY}" ]; then
    echo "No repository specified!"
    _print_usage
    exit 1
  fi

  ALIAS="ffflorian/nodejs10"

  docker build -t "${ALIAS}" .
  docker run -e REPOSITORY="${REPOSITORY}" -e BRANCH="${BRANCH}" "${ALIAS}" "/run.sh"
fi
