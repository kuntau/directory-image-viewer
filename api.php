<?php

// echo "Fake api\n========";

// var_dump($HTTP_RAW_POST_DATA);
// var_dump( $_POST["directory"] );
// $json_string_data = file_get_contents('php://input');
// $decoded_data = json_decode($json_string_data, true);
// $_POST = $decoded_data;
// var_dump($_POST);
// var_dump($_REQUEST);
// $directory = $_POST["directory"];
$directory = $_REQUEST["directory"];

if ($handle = opendir($directory)) {
  // echo "Dir handle: $handle\n";
  // echo "Entries:\n";
  $files = array();

  while (false !== ($entry = readdir($handle))) {
    if ($entry != "." && $entry != ".." && $entry != "index.html") {
      // echo "$entry\n";
      array_push($files, $entry);
    }
  };

  // print_r($files);
  echo json_encode($files);
  closedir($handle);
}

?>
