CREATE OR REPLACE FUNCTION update_current_balance()
RETURNS TRIGGER AS $$
DECLARE
    rate_to_usd NUMERIC;
BEGIN
    -- Find the nearest rate_to_usd before or after the updated timestamp
    SELECT COALESCE(
        (
            SELECT rate_to_usd 
            FROM currency 
            WHERE 
                currency.id = NEW.currency_id 
                AND currency.updated < NEW.updated 
            ORDER BY currency.updated DESC 
            LIMIT 1
        ), 
        (
            SELECT rate_to_usd 
            FROM currency 
            WHERE 
                currency.id = NEW.currency_id 
                AND currency.updated > NEW.updated 
            ORDER BY currency.updated ASC 
            LIMIT 1
        )
    ) INTO rate_to_usd;

    -- Insert the calculated balance in USD into the balance_history table
    INSERT INTO balance_history (name, lastname, currency_name, currency_in_usd)
    SELECT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        c.name AS currency_name,
        NEW.money * rate_to_usd AS currency_in_usd
    FROM
        currency AS c
    LEFT JOIN
        "user" AS u ON u.id = NEW.user_id
    WHERE
        c.id = NEW.currency_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;