<?php 
// ini untuk input data ke database
header('Content-Type: application/json');
include 'config.php';

$itemCode = $_POST['item_code'];
$itemName = $_POST['item_name'];
$price = $_POST['price'];
$stock = $_POST['stock'];

//fungsi untuk simpan 
$save = mysqli_query($conn, "INSERT INTO tb_item(item_code, item_name, price, stock)VALUES('".$itemCode."','".$itemName."','".$price."','".$stock."')");
if($save){
    echo 'Success';
} else{
    echo 'Failed';
}
?>