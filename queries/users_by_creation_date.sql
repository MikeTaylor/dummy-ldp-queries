--ldp:function get_users

CREATE FUNCTION get_users(
    start_date date,
    end_date date
)
RETURNS TABLE(
    id uuid,
    barcode text)
AS $$
SELECT id, barcode

    FROM user_users
    WHERE user_users.created_date >= start_date AND user_users.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
