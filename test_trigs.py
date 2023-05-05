import unittest
import psycopg2
import sqlite3


#1
class TestParticipantView(unittest.TestCase):

    def setUp(self):
        self.connection = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port = "5432")

        self.cursor = self.connection.cursor()

        self.cursor.execute("""
            insert into swimmer (swimmer_id, swimmer_name, birth_date, country_nm, card_no)
            values (1, 'John Doe', '1990-01-01', 'USA', '4276123456780000')
        """)

        self.connection.commit()

    def test_masked_card_no(self):
        self.cursor.execute("select * from participant_view")
        result = self.cursor.fetchone()
        self.assertEqual(result[4], '4276********0000')

    def tearDown(self):
        self.cursor.execute("delete from swimmer where swimmer_id = 1")
        self.connection.commit()
        self.cursor.close()
        self.connection.close()

if __name__ == '__main__':
    unittest.main()

# ----------------------------------------------------#
# Этот тест подключается к базе данных, создает запись в таблице swimmer с номером карты, запускает представление participant_view и проверяет, что поле masked_card_no содержит номер карты с маскировкой. Затем тест удаляет созданную запись из таблицы swimmer и закрывает соединение с базой данных.
# Если тест проходит успешно, выводится сообщение "OK", а в противном случае, error соответствующего характера.
# Коммент проверяющему: для проверки корректности должны быть установлены необходимые пакеты.



#2
# Функция для выполнения запросов к базе данных
def execute_query(query):
    connection = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port = "5432")
    cursor = connection.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    connection.close()
    return result

# Создаем представление medical_staff_view
create_view_query = """
CREATE VIEW medical_staff_view AS
SELECT
    m.medstaff_name,
    o.country,
    o.olymp_date,
    m.priority
FROM medical_staff m
JOIN olympiad o ON m.olympiad_id = o.olympiad_id;
"""
execute_query(create_view_query)

# Тестирование представления medical_staff_view
def test_medical_staff_view():
    # Ожидаемый результат
    expected_result = [
        ("John Doe", "Russia", "2020-07-24", "High"),
        ("Jane Smith", "USA", "2020-07-24", "Low")
    ]
    # Получаем результат из представления
    query = "SELECT * FROM medical_staff_view"
    result = execute_query(query)
    # Сравниваем результаты
    assert result == expected_result, "Test failed"
    print("Test passed")

# Вызываем функцию тестирования
test_medical_staff_view()


# В этом скрипте мы сначала создаем представление medical_staff_view,
#  затем определяем функцию test_medical_staff_view(), которая содержит
# запрос к представлению и проверку результата. Мы ожидаем, что представление
#  вернет список медицинского персонала для олимпиады в 2020 году, включающий имена, страны, даты и приоритеты.


#3
def test_team_view():
    conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port = "5432")
    cur = conn.cursor()

    # Проверяем количество строк в представлении
    cur.execute("SELECT COUNT(*) FROM team_view")
    result = cur.fetchone()[0]
    expected = 10 # Например, мы ожидаем 10 строк
    assert result == expected, f"Ожидали {expected} строк, получили {result} строк"

    # Проверяем, что каждая строка содержит корректную информацию
    cur.execute("SELECT swimmer_name, country_nm, coach_name FROM team_view")
    rows = cur.fetchall()
    for row in rows:
        swimmer_name, country_nm, coach_name = row
        assert swimmer_name is not None, "Имя участника команды не должно быть пустым"
        assert country_nm is not None, "Название страны не должно быть пустым"
        assert coach_name is not None, "Имя тренера не должно быть пустым"

    conn.close()

# В этом примере мы подключаемся к базе данных diht_db, выполняем два запроса к представлению team_view и проверяем количество строк и содержимое каждой строки. Если тест проходит успешно, то никаких сообщений не выводится, иначе мы получим сообщение с деталями ошибки.


#4
def test_competition_results_view():


    conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
cur = conn.cursor()
# Проверяем количество строк в представлении
cur.execute("SELECT COUNT(*) FROM competition_results_view")
result = cur.fetchone()[0]
expected = 100  # Например, мы ожидаем 100 строк, если в таблице competition было 10 соревнований с 10 участниками на каждом
assert result == expected, f"Ожидали {expected} строк, получили {result} строк"

# Проверяем, что каждая строка содержит корректную информацию
cur.execute("SELECT swimmer_name, country, olymp_date, style, distance, distance_time FROM competition_results_view")
rows = cur.fetchall()
for row in rows:
    swimmer_name, country, olymp_date, style, distance, distance_time = row
    assert swimmer_name is not None, "Имя участника не должно быть пустым"
    assert country is not None, "Название страны не должно быть пустым"
    assert olymp_date is not None, "Дата олимпиады не должна быть пустой"
    assert style is not None, "Стиль заплыва не должен быть пустым"
    assert distance is not None, "Дистанция не должна быть пустой"
    assert distance_time is not None, "Время не должно быть пустым"

conn.close()


#5
def test_olympiad_stats_view():
    conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
    cur = conn.cursor()

    # Проверяем количество строк в представлении
    cur.execute("SELECT COUNT(*) FROM olympiad_stats_view")
    result = cur.fetchone()[0]
    expected = 3  # Например, мы ожидаем 3 строки
    assert result == expected, f"Ожидали {expected} строк, получили {result} строк"

    # Проверяем, что каждая строка содержит корректную информацию
    cur.execute("SELECT country, olymp_date, num_competitions, min_time, max_time, avg_time FROM olympiad_stats_view")
    rows = cur.fetchall()
    for row in rows:
        country, olymp_date, num_competitions, min_time, max_time, avg_time = row
        assert country is not None, "Название страны не должно быть пустым"
        assert olymp_date is not None, "Дата олимпиады не должна быть пустой"
        assert num_competitions is not None, "Количество соревнований не должно быть пустым"
        assert min_time is not None, "Минимальное время не должно быть пустым"
        assert max_time is not None, "Максимальное время не должно быть пустым"
        assert avg_time is not None, "Среднее время не должно быть пустым"

    conn.close()


#6
def test_country_results_view():
    conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
    cur = conn.cursor()

    # Проверяем количество строк в представлении
    cur.execute("SELECT COUNT(*) FROM country_results_view")
    result = cur.fetchone()[0]
    expected = 5 # Например, мы ожидаем 5 строк, так как представление отфильтровано по стране 'Russia'
    assert result == expected, f"Ожидали {expected} строк, получили {result} строк"

    # Проверяем, что каждая строка содержит корректную информацию
    cur.execute("SELECT swimmer_name, olymp_date, style, distance, distance_time FROM country_results_view")
    rows = cur.fetchall()
    for row in rows:
        swimmer_name, olymp_date, style, distance, distance_time = row
        assert swimmer_name is not None, "Имя участника не должно быть пустым"
        assert olymp_date is not None, "Дата олимпиады не должна быть пустой"
        assert style is not None, "Название стиля не должно быть пустым"
        assert distance is not None, "Дистанция не должна быть пустой"
        assert distance_time is not None, "Время не должно быть пустым"

    conn.close()


#7
def test_medical_staff_count_view():
    conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
    cur = conn.cursor()

    # Проверяем количество строк в представлении
    cur.execute("SELECT COUNT(*) FROM medical_staff_count")
    result = cur.fetchone()[0]
    expected = 5  # Например, мы ожидаем 5 строк
    assert result == expected, f"Ожидали {expected} строк, получили {result} строк"

    # Проверяем, что каждая строка содержит корректную информацию
    cur.execute("SELECT olympiad_id, olymp_date, med_staff_count FROM medical_staff_count")
    rows = cur.fetchall()
    for row in rows:
        olympiad_id, olymp_date, med_staff_count = row
        assert olympiad_id is not None, "ID олимпиады не должно быть пустым"
        assert olymp_date is not None, "Дата олимпиады не должна быть пустой"
        assert med_staff_count is not None, "Количество медицинского персонала не должно быть пустым"

    conn.close()


#8
conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
cur = conn.cursor()
cur.execute('CREATE VIEW team_roster AS SELECT t.swimmer_id, s.swimmer_name, t.coach_id, c.name AS coach_name, t.contruct_nom, o.olympiad_id, o.olymp_date FROM team t JOIN swimmer s ON t.swimmer_id = s.swimmer_id JOIN coach c ON t.coach_id = c.coach_id JOIN competition comp ON t.swimmer_id = comp.swimmer_id JOIN olympiad o ON comp.olympiad_id = o.olympiad_id;')
cur.execute('SELECT * FROM team_roster')
result = cur.fetchall()
# проверка
assert len(result) > 0, 'Нет данных в представлении team_roster'
conn.close()


#9
class TestCompetitionResultsView(unittest.TestCase):

    def setUp(self):
        # Установка соединения с базой данных
        self.conn = psycopg2.connect(host="localhost", database="pg_db", user="postgres", password="postgrespw", port="5432")
        self.cur = self.conn.cursor()

        # Создание тестовых данных
        self.cur.execute("INSERT INTO swimmer (swimmer_id, swimmer_name, birth_date, country_nm) VALUES (1, 'John Smith', '1995-01-01', 'USA')")
        self.cur.execute("INSERT INTO olympiad (olympiad_id, olymp_date) VALUES (1, '2020-07-01')")
        self.cur.execute("INSERT INTO competition (competition_id, swimmer_id, olympiad_id, style, distance, distance_time) VALUES (1, 1, 1, 'freestyle', 100, 50.5)")
        self.conn.commit()

    def tearDown(self):
        # Удаление тестовых данных
        self.cur.execute("DELETE FROM competition")
        self.cur.execute("DELETE FROM olympiad")
        self.cur.execute("DELETE FROM swimmer")
        self.conn.commit()

        # Закрытие соединения с базой данных
        self.cur.close()
        self.conn.close()

    def test_competition_results_view(self):
        # Получение данных из представления
        self.cur.execute("SELECT * FROM competition_results")
        results = self.cur.fetchall()

        # Проверка результатов
        self.assertEqual(len(results), 1)
        self.assertEqual(results[0][1], 'John Smith')
        self.assertEqual(results[0][3], 'USA')
        self.assertEqual(results[0][6], 'freestyle')
        self.assertEqual(results[0][7], 100)
        self.assertEqual(results[0][8], 50.5)

if __name__ == '__main__':
    unittest.main()
