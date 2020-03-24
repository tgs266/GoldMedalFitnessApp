#!/bin/bash
#
# (Above line comes out when placing in Xcode scheme)
#

API_TOKEN="-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgZ7d9nLrjmuAB1Kw6
3xxvfyPWPVX/qTqh9XMaOmcPXCagCgYIKoZIzj0DAQehRANCAARCuD6wWg+On5ui
2PbWr+dV/1V1f9xAcd0R60MnsIXDs4vVGCpi1z+CJHyXrPp+19s6xohphSZ7o6qv
FjxoBXWc
-----END PRIVATE KEY-----"
TEAM_TOKEN=<TestFlight team token here>
SIGNING_IDENTITY="iPhone Distribution: Development Seed"
PROVISIONING_PROFILE="${HOME}/Library/MobileDevice/Provisioning Profiles/MapBox Ad Hoc.mobileprovision"
#LOG="/tmp/testflight.log"
GROWL="${HOME}/bin/growlnotify -a Xcode -w"