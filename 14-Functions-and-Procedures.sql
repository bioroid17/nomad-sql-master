CREATE EXTENSION plpython3u;

CREATE OR REPLACE FUNCTION hello_world_py (name TEXT) RETURNS TEXT AS $$
  def hello(name):
    return f'hello {name}'
  output = hello(name)
  return output
$$ LANGUAGE plpython3u;

SELECT
  hello_world_py ('nico');

CREATE OR REPLACE FUNCTION log_updated_at_py () RETURNS TRIGGER AS $$
  import json, requests
  
  requests.post('http://localhost:3000', data=json.dumps(TD))
$$ LANGUAGE plpython3u;

CREATE TRIGGER updated_at_py BEFORE
UPDATE ON movies FOR EACH ROW
EXECUTE PROCEDURE log_updated_at_py ();
