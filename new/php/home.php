<?php
    include "includes/dbh.php";
    session_start();

    $year = $_POST["year"] ?? "";
    $month = $_POST["month"] ?? "";
    $status = $_POST["status"] ?? "";
    $role = $_POST["role"] ?? "";

    // $year_sql = "SELECT DISTINCT YEAR(`date`) `year` FROM `attendance`;";
    // $year_results = mysqli_query($conn, $year_sql);
    
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" charset="UTF-8" type="text/css" href="../css/style.css">

    <link rel="icon" href="">
    <title>College Management System</title>
</head>
<body>
    <header>
        <div class="header-logo">
            <img src="../img/URS-Logo.jpg" alt="University of Rizal System Logo">
        </div>
        <div style="display: flex; flex-flow: column nowrap; gap: 1rem;">
            <h1 style="font-size: 2rem; font-weight: 800;">Welcome, 
                <?php
                    $substr = substr($_SESSION["username"], 0, 2);
                    if ($substr === "ad") {
                        echo "Admin!";
                    } else if ($substr === "te") {
                        echo "Teacher!";
                    } else if ($substr === "st") {
                        echo "Student!";
                    }
                ?>
            </h1>
            <div style="display: flex; gap: 0 1em; align-items: center;">
                <form class="navigation-ul" method="post" action="home.php">
                    <button type="submit" name="option" value="home">Home</button>
                    <button type="submit" name="option" value="attendance">Attendance</button>
                    <button type="submit" name="option" value="capstone">Capstone Schedules</button>
                    <button type="submit" name="option" value="course">Courses</button>
                    <button type="submit" name="option" value="student">Students</button>
                    <button type="submit" name="option" value="teacher">Teachers</button>
                    <button type="submit" name="option" value="report">Reports</button>
                </form>
                <h3 style="font-size: 1.4rem; font-weight: 650;"><a href="../index.php">LOGOUT</a></h3>
            </div>
        </div>
    </header>
    <main>
        <section>
            <?php
                if (isset($_POST["option"]) && $_POST["option"] == "home") {

                } else if (isset($_POST["option"]) && $_POST["option"] == "attendance") {
                    echo '
                    <div class="ms attendance">
                        <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                            <form class="attendance-ul">
                                <select name="year" required>
                                    <option disabled selected hidden value="">Year</option>
                                    <?php
                                        foreach($year_results as $year_result) {
                                            $curr_year = $year_result["year"];
                                            echo "<option ".($year == $curr_year ? "selected" : "").">$curr_year</option>";
                                        }
                                    ?>
                                </select>
                                <select name="month" required>
                                    <option disabled selected hidden value="">Month</option>
                                    <option '.($month == "all" ? "selected" : "").' value="all">All months</option>
                                    <option '.($month == "1" ? "selected" : "").' value="1">January</option>
                                    <option '.($month == "2" ? "selected" : "").' value="2">February</option>
                                    <option '.($month == "3" ? "selected" : "").' value="3">March</option>
                                    <option '.($month == "4" ? "selected" : "").' value="4">April</option>
                                    <option '.($month == "5" ? "selected" : "").' value="5">May</option>
                                    <option '.($month == "6" ? "selected" : "").' value="6">June</option>
                                    <option '.($month == "7" ? "selected" : "").' value="7">July</option>
                                    <option '.($month == "8" ? "selected" : "").' value="8">August</option>
                                    <option '.($month == "9" ? "selected" : "").' value="9">September</option>
                                    <option '.($month == "10" ? "selected" : "").' value="10">October</option>
                                    <option '.($month == "11" ? "selected" : "").' value="11">November</option>
                                    <option '.($month == "12" ? "selected" : "").' value="12">December</option>
                                </select>
                                <select name="status" required>
                                    <option disabled selected hidden value="">Status</option>
                                    <option '.($status == "present" ? "selected" : "").' value="present">Present</option>
                                    <option '.($status == "absent" ? "selected" : "").' value="absent">Absent</option>
                                </select>
                                <select name="role" required>
                                    <option disabled selected hidden value="">Role</option>
                                    <option '.($role == "admin" ? "selected" : "").' value="admin">Admin</option>
                                    <option '.($role == "teacher" ? "selected" : "").' value="teacher">Teacher</option>
                                    <option '.($role == "student" ? "selected" : "").' value="student">Student</option>
                                </select>
                                <button type="submit" name="submit" value="submit">SEE ATTENDANCE</button>
                            </form>
                        </div>
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>STATUS</th>
                                        <th>NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2023 September 30</td>
                                        <td>Present</td>
                                        <td>John Doe John Doe John Doe John Doe John Doe John Doe John Doe John Doe John Doe John Doe </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    ';
                } else if (isset($_POST["option"]) && $_POST["option"] == "capstone") {
                    echo '
                    <div class="ms capstoneschedule">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>DATE & TIME</th>
                                        <th>CLASS</th>
                                        <th>COURSE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>00001</td>
                                        <td>2080 September 30 20:20AM</td>
                                        <td>BSCS 3-3</td>
                                        <td>COSC 880</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="capstoneschedule-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="capstoneschedule-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="date">DATE</label>
                                    <input type="date">
                                </div>

                                <div class="il">
                                    <label for="class">CLASS</label>
                                    <input id="class" type="text" name="class" placeholder="Enter class..." required>
                                </div>

                                <div class="il">
                                    <label for="course">COURSE</label>
                                    <input id="course" type="text" name="course" placeholder="Enter course..." required>
                                </div>

                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_POST["option"]) && $_POST["option"] == "course") {
                    echo '
                    <div class="ms course">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>COURSE CODE</th>
                                        <th>COURSE NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>00001</td>
                                        <td>GNED 01</td>
                                        <td>Art Appreciation</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="course-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="course-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%"  for="date">COURSE CODE</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course code..." required>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="class">COURSE NAME</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course name..." required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_POST["option"]) && $_POST["option"] == "student") {
                    echo '
                    <div class="ms student">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>PROGRAM</th>
                                        <th>CLASS</th>
                                        <th>FULL NAME</th>
                                        <th>AGE</th>
                                        <th>SEX</th>
                                        <th>BIRTH DATE</th>
                                        <th>CONTACT NUMBER</th>
                                        <td>EMAIL ADDRESS</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>00001</td>
                                        <td>BSCS</td>
                                        <td>YEAR 2 - CLASS 1</td>
                                        <td>Jane Doe</td>
                                        <td>21</td>
                                        <td>FEMALE</td>
                                        <td>2002-09-29</td>
                                        <td>09091231234</td>
                                        <td>jane.doe@urs.edu.ph</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="student-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="student-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%"  for="date">COURSE CODE</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course code..." required>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="class">COURSE NAME</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course name..." required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_POST["option"]) && $_POST["option"] == "attendance") {
                    
                } else if (isset($_POST["option"]) && $_POST["option"] == "attendance") {
                    
                }
            
// Nasa taas mga commits ko BORDER +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
            ?>
        </section>
    </main>
</body>
</html>