import psycopg2

with psycopg2.connect(database="client_db", user="postgres", password="firebending") as conn:
    with conn.cursor() as cur:
        
        def create_a_database():
            cur.execute('''
        CREATE TABLE IF NOT EXISTS client (
            id SERIAL PRIMARY KEY,
            first_name VARCHAR(40),
            last_name VARCHAR(40),
            email VARCHAR(50),
            number_phone BIGINT NOT NULL
        );
    ''')
        def new_client (first_name, last_name, email,phone = None):
            cur.execute('''
                INSERT INTO client (first_name, last_name, email, phone) 
                VALUES (%s, %s, %s)
            ''',(first_name, last_name, email, phone))
            conn.commit()

        def add_number_phone(phone,client_id):
            cur.execute('''
                UPDATE client 
                SET number_phone = %s
                WHERE id = %s         
        ''',(phone,client_id))
            conn.commit()
            
        def change_date_client(first_name,last_name, email, phone, client_id):
            cur.execute('''
                UPDATE client
                SET 
                    first_name = %s,
                    last_name =  %s,
                    email=  %s,
                    phone = %s
                WHERE id = %s
        ''',(first_name,last_name, email,phone, client_id))
            conn.commit()
            
        def delet_phone(phone, client_id):
            cur.execute('''
                UPDATE client 
                SET number_phone = NULL
                WHERE id = %s         
        ''',(client_id,))
            conn.commit()       
