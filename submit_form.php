<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userId = $_SESSION['user_id']; // Assuming user ID is stored in session
    $listingType = $_POST['listing_type'];
    $category = $_POST['category'];
    // Collect other form data...

    // Insert into forms table
    $stmt = $pdo->prepare("INSERT INTO forms (user_id, listing_type, category, ...) VALUES (?, ?, ?, ...)");
    $stmt->execute([$userId, $listingType, $category, ...]);

    // Redirect or show success message
    header("Location: listing_user.php");
}
?>