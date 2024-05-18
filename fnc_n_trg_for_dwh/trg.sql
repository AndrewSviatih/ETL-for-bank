-- Create trigger for balance table
CREATE TRIGGER update_balance_trigger
AFTER INSERT OR UPDATE ON balance
FOR EACH ROW
EXECUTE FUNCTION update_current_balance();

-- Create trigger for currency table
CREATE TRIGGER update_currency_trigger
AFTER INSERT OR UPDATE ON currency
FOR EACH ROW
EXECUTE FUNCTION update_current_balance();