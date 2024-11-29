<?php
include 'db.php';

$stmt = $pdo->query("SELECT * FROM forms WHERE user_id = {$_SESSION['user_id']}");
$forms = $stmt->fetchAll();

foreach ($forms as $form) {
    echo "<div>";
    echo "<h3>Form ID: {$form['id']}</h3>";
    echo "<p>Listing Type: {$form['listing_type']}</p>";
    echo "<p>Category: {$form['category']}</p>";
    // Display other form details...
    echo "<a href='edit_form.php?id={$form['id']}'>Edit</a>";
    echo "<input type='checkbox' " . ($form['uploaded_to_social_media'] ? 'checked' : '') . "> Uploaded to Social Media";
    echo "</div>";
}
?>