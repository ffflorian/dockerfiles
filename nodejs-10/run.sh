#!/usr/bin/env bash

set -e

if [ -f "/.dockerenv" ]; then
  TMP_DIR="$(mktemp -d -p .)"

  echo "Cloning from ${REPOSITORY} ..."

  git clone -q "${REPOSITORY}" "${TMP_DIR}"
  cd "${TMP_DIR}"

  if [ ! -z "${BRANCH}" ]; then
    git checkout "${BRANCH}"
  fi

  yarn
  yarn test
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
        exit 1
        ;;
    esac
  done

  if [ -z "${REPOSITORY}" ]; then
    echo "No repository specified!"
    exit 1
  fi

  ALIAS="ffflorian/nodejs10"

  docker build -t "${ALIAS}" .
  docker run -e REPOSITORY="${REPOSITORY}" -e BRANCH="${BRANCH}" "${ALIAS}" "/run.sh"
fi
