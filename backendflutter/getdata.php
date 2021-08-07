<?php
//include confignya 
header('Content-Type: application/json');
include 'config.php';

    $query = mysqli_query($conn, "SELECT * FROM tb_item");
    $output = array();
    while($get = mysqli_fetch_assoc($query)){
        $output[] = $get;

    }
    echo json_encode($output);
?>