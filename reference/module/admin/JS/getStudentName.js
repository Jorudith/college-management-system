function getStudentNameAndId(){

    var e = document.getElementById("studentName");
    var studentId = e.options[e.selectedIndex].value;
    //alert(classId);
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("studentName").innerHTML = xhttp.responseText;
        }
    };
    xhttp.open("GET", "searchStudentName.php?key="+studentId,true);
    xhttp.send();
}