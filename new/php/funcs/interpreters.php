<?php

function month_interpreter($month, $start, $length) {
    switch (substr($month, $start, $length)) {
        case "01":
            return "Januray";
            break;
        case "02":
            return "February";
            break;
        case "03":
            return "March";
            break;
        case "04":
            return "April";
            break;
        case "05":
            return "May";
            break;
        case "06":
            return "June";
            break;
        case "07":
            return "July";
            break;
        case "08":
            return "August";
            break;
        case "09":
            return "September";
            break;
        case "10":
            return "October";
            break;
        case "11":
            return "November";
            break;
        case "12":
            return "December";
            break;
        default:
            break;
    }
}

function to_standard_time($time) {
    $hour = substr($time, 0, 2);
    $minute = substr($time, 3, 2);
    $interpreted = "";

    if ($hour >= 12) {
        $interpreted .= "PM";
    } else {
        $interpreted .= "AM";
    }

    if ($hour >= 13) {
        $hour -= 12;
    }

    return $hour.":".$minute.":".$interpreted;
}

?>