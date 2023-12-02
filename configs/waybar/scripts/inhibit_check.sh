#!/bin/sh
printstatus() {
	CLASS="no" && [[ $(cat "$INHIBIT_DIR") == '1' ]] && CLASS="yes"
	PERCENT=0 && [[ $CLASS == "yes" ]] && PERCENT=100

	printf "{\"tooltip\":\"Currently inhibiting early sleep: $CLASS\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
}

printstatus
while true; do
	while [[ ! -f "$INHIBIT_DIR" ]]; do
		echo '0' >"$INHIBIT_DIR"
	done

	inotifywait "$INHIBIT_DIR" &>/dev/null
	sleep 0.2

  printstatus
done
