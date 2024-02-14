<?php

include ("dbconnection.php");

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');

$con = dbconnection();

$query = "SELECT * FROM transactions";

$result = mysqli_query($con,$query);

$transactions = mysqli_fetch_all($result, MYSQLI_ASSOC);

if($transactions){
    print_r(json_encode($transactions));
    return json_encode($transactions);
}

?>