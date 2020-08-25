#!/bin/bash

# Slack notification script for Munin
# Mark Matienzo (@anarchivist)
#
# To use:
# 1) Create a new incoming webhook for Slack
# 2) Edit the configuration variables that start with "SLACK_" below
# 3) Add the following to your munin configuration:
#
# # -- Slack contact configuration
# contact.slack.command MUNIN_SERVICESTATE="${var:worst}" MUNIN_HOST="${var:host}" MUNIN_SERVICE="${var:graph_title}" MUNIN_GROUP=${var:group} MUNIN_IMAGE="http://munin.example.org/${var:group}/${var:host}/${var:plugin}-day.png" /usr/local/bin/notify_slack_munin
# contact.slack.always_send warning critical
# # note: This has to be on one line for munin to parse properly
# contact.slack.text ${if:cfields \u000A* CRITICALs:${loop<,>:cfields  ${var:label} is ${var:value} (outside range [${var:crange}])${if:extinfo : ${var:extinfo}}}.}${if:wfields \u000A* WARNINGs:${loop<,>:wfields  ${var:label} is ${var:value} (outside range [${var:wrange}])${if:extinfo : ${var:extinfo}}}.}${if:ufields \u000A* UNKNOWNs:${loop<,>:ufields  ${var:label} is ${var:value}${if:extinfo : ${var:extinfo}}}.}${if:fofields \u000A* OKs:${loop<,>:fofields  ${var:label} is ${var:value}${if:extinfo : ${var:extinfo}}}.}


SLACK_CHANNEL="slackchannel"
SLACK_WEBHOOK_URL="slackwebhookurl"
SLACK_USERNAME="slackuser"
SLACK_ICON_EMOJI="slackicon"

# Url to link from slack notifications
MUNIN_URL="http://muninurl/problems.html"

input=`cat`

#Set the message icon based on service state
if [ "$MUNIN_SERVICESTATE" = "CRITICAL" ]
then
    ICON=":exclamation:"
    COLOR="danger"
elif [ "$MUNIN_SERVICESTATE" = "WARNING" ]
then
    ICON=":warning:"
    COLOR="warning"
elif [ "$MUNIN_SERVICESTATE" = "ok" ]
then
    ICON=":white_check_mark:"
    COLOR="good"
elif [ "$MUNIN_SERVICESTATE" = "OK" ]
then
    ICON=":white_check_mark:"
    COLOR="good"
elif [ "$MUNIN_SERVICESTATE" = "UNKNOWN" ]
then
    ICON=":question:"
    COLOR="#00CCCC"
else
    ICON=":white_medium_square:"
    COLOR="#CCCCCC"
fi

# Generate the JSON payload
PAYLOAD="{\"channel\": \"${SLACK_CHANNEL}\", \"username\": \"${SLACK_USERNAME}\", \"attachments\": [{\"image_url\": \"${MUNIN_IMAGE}\", \"color\": \"${COLOR}\", \"fallback\": \"Munin alert - ${MUNIN_SERVICESTATE}: ${MUNIN_SERVICE} on ${MUNIN_HOST}\", \"pretext\": \"${ICON} Munin alert - ${MUNIN_SERVICESTATE}: ${MUNIN_SERVICE} on ${MUNIN_HOST} in ${MUNIN_GROUP} - <${MUNIN_URL}|View Munin>\", \"fields\": [{\"title\": \"Severity\", \"value\": \"${MUNIN_SERVICESTATE}\", \"short\": \"true\"}, {\"title\": \"Service\", \"value\": \"${MUNIN_SERVICE}\", \"short\": \"true\"}, {\"title\": \"Host\", \"value\": \"${MUNIN_HOST}\", \"short\": \"true\"}, {\"title\": \"Current Values\", \"value\": \"${input}\", \"short\": \"false\"}]}]}"

#Send message to Slack
curl -sX POST -o /dev/null --data "payload=${PAYLOAD}" $SLACK_WEBHOOK_URL
