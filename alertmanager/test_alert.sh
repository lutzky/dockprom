#!/bin/bash

name="TEST_ALERT"
url='http://localhost/alertmanager/api/v1/alerts'
severity="critical"

resolved=yes

now() {
	date --iso-8601=seconds
}

status=firing
if [[ -n $resolved ]]; then
	maybeEnds='"endsAt": "'$(now)'",'
	status=resolved
fi


alert_json() {
	echo '[{
	"Status": "'$status'",
	"labels": {
		"alertname": "TEST_ALERT_2",
		"service": "my-service",
		"severity": "'$severity'",
		"instance": "michael"
	},
	"annotations": {
		"description": "This is a test alert"
	},
	"generatorURL": "http://prometheus.int.example.net/<generating_expression>",
	'$maybeEnds'
	"startsAt": "'$(now)'"
	}]'
}

echo "Sending this:"
alert_json
echo

curl -XPOST $url -d "$(alert_json)"
