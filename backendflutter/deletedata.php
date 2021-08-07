<?php 
header('Content-Type: application/json');
include 'config.php';
    $id = $_POST['id'];
    $delete = mysqli_query($conn, "DELETE FROM tb_item WHERE id=".$id);
    if($delete){
        echo 'Success';
    } else {
        echo 'Gagal';
    }
?>
