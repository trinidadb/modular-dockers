import psycopg2

class PostgresManager():
    
    def __init__(self, user, password, db_name, host="localhost", port=5432):
        self.connection = psycopg2.connect(host=host, port=port, database=db_name, user=user, password=password)
        self.cursor = self.connection.cursor() # Cursor object to interact with the database

    def close_client(self):
        self.cursor.close()
        self.connection.close()

    def _send_queries(self, queries: list):
        try:
            for query in queries:
                self.cursor.execute(query)
            self.connection.commit()
            print("Queries sent successfully")

        except Exception as error:
            print(f"Error inserting data: {error}")
        
        finally:
            self.close_client()

    def insert_custom_row(self, rowNum: int):
        query = f"""
            INSERT INTO public.testtable (col_name_1, col_name_2)
            VALUES ('test row {rowNum}', false);
        """
        self._send_queries([query])

    def create_user(self, username, password, db_name="my-db"):
        # SQL queries to create a new user and grant read-only privileges
        create_user_query = f'CREATE USER "{username}" WITH PASSWORD \'{password}\';'
        grant_select_query = f'GRANT CONNECT ON DATABASE "{db_name}" TO "{username}";'
        grant_usage_schema_query = f'GRANT USAGE ON SCHEMA public TO "{username}";'
        grant_select_privileges_query = f'GRANT SELECT ON ALL TABLES IN SCHEMA public TO "{username}";' #SELECT only to read tables, no to modify them

        queries = [create_user_query, grant_select_query, grant_usage_schema_query, grant_select_privileges_query]
        self._send_queries(queries)

if __name__ == "__main__":
    PostgresManager("admin", "vamosargentina", "my-db").create_user("trinidad.burs", "mi-pwd")