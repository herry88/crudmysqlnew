<?php
	
    header('content-type:application/json');

	include 'config.php';
	
	$id = isset($_POST['id']) ? $_POST['id'] : '';
	$itemCode = isset($_POST['item_code']) ? $_POST['item_code'] : '';
    $itemName = isset($_POST['item_name']) ? $_POST['item_name'] : '';
    $price = isset($_POST['price']) ? $_POST['price'] : '';
    $stock = isset($_POST['stock']) ? $_POST['stock'] : '';
	
	$update =  "UPDATE tb_item SET item_code='".$itemCode."', item_name='".$itemName."', price='".$price."', stock='".$stock."' WHERE id='".$id."'";
    $result = mysqli_query($conn,$update);
    if($result){
        $resultData = array('status' => true, 'message' => 'Post Updated Successfully...');
        }else{
            $resultData = array('status' => false, 'message' => 'Can\'t able to update a post details...');
        }

    
    
       echo json_encode($resultData);

?>