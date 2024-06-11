<?php
header('Content-Type: application/json');

// Підключення до бази даних
$servername = "localhost";
$username = "new_root";
$password = "123456";
$dbname = "veb_dod";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Отримання ID книги із запиту
    $book_id = isset($_GET['book_id']) ? intval($_GET['book_id']) : null;

    if ($book_id) {
        // Підготовка та виконання SQL-запиту для вибраної книги
        $stmt = $conn->prepare("SELECT ID_Book, NameOfBook, Author, Genre, TypeOf, CountOfPages, YearOf, Vydavnytstvo, ISBN FROM Books WHERE ID_Book = :book_id");
        $stmt->bindParam(':book_id', $book_id, PDO::PARAM_INT);
        $stmt->execute();
        
        // Перевірка результату запиту та відправка даних у JSON форматі
        $book_data = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($book_data) {
            echo json_encode($book_data, JSON_UNESCAPED_UNICODE); // Відправляємо дані у форматі JSON
        } else {
            echo json_encode(array("error" => "Книга не знайдена"), JSON_UNESCAPED_UNICODE);
        }
    } else {
        echo json_encode(array("error" => "Не вказано ID книги"), JSON_UNESCAPED_UNICODE);
    }
} catch(PDOException $e) {
    echo json_encode(array("error" => "Помилка: " . $e->getMessage()), JSON_UNESCAPED_UNICODE);
}

// Закриття з'єднання
$conn = null;

