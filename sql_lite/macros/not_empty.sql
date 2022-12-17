{% test not_empty(model, column_name) %}

    select total_rows from (select count({{ column_name }}) as total_rows from {{ model }}) where total_rows = 0

{% endtest %}