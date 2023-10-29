<?php

function gwa_convert($grade) {
    if (is_numeric($grade) && !empty($grade)) {
        $rounded = round($grade);
    } else {
        return "INC";
    }

    if ($rounded >= 96) {
        return "1.00";
    } else if ($rounded >= 94) {
        return "1.25";
    } else if ($rounded >= 91) {
        return "1.50";
    } else if ($rounded >= 88) {
        return "1.75";
    } else if ($rounded >= 85) {
        return "2.00";
    } else if ($rounded >= 83) {
        return "2.25";
    } else if ($rounded >= 80) {
        return "2.50";
    } else if ($rounded >= 78) {
        return "2.75";
    } else if ($rounded >= 75) {
        return "3.00";
    } else if ($rounded > 75) {
        return "5.00";
    } else {
        return "INC";
    }
}