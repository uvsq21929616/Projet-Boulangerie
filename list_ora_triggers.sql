SELECT
    table_name,
    trigger_name,
    triggering_event,
    trigger_body
FROM
    user_triggers
ORDER BY
	table_name;