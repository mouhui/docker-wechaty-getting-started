#!/usr/bin/env bats

# import WECHATY_IMAGE from bin/docker-config.sh
source bin/docker-config.sh

function dockerRun() {
  docker run -v "$(pwd)":/bot ${WECHATY_IMAGE} $@
}

fixtures=tests/fixtures

@test "should succ with javascript" {
  cd "$fixtures"
  run dockerRun javascript.js

  [ "$status" -eq 0 ]
  [[ $output =~ "SMOKE TESTING PASSED" ]]
}

@test "should succ with typescript" {
  cd "$fixtures"
  run dockerRun typescript.ts

  [ "$status" -eq 0 ]
  [[ $output =~ "SMOKE TESTING PASSED" ]]
}
