<?php

function getTable($connection, $table) {
    if ($table == "course") {
        $sql = "SELECT * FROM $table ORDER BY `code`;";
        return mysqli_query($connection, $sql);
    } else {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    }
    
}

?>