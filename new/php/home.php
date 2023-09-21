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
            <h1 style="font-size: 2rem; font-weight: 800;">Welcome, Admin.</h1>
            <div style="display: flex; gap: 0 1em; align-items: flex-end;">
                <ul class="navigation-ul">
                    <li>Home</li>
                    <li>Attendance</li>
                    <li>Capstone Schedules</li>
                    <li>Courses</li>
                    <li>Students</li>
                    <li>Teachers</li>
                    <li>Reports</li>
                </ul>
                <h3 style="font-size: 1.4rem; font-weight: 650;">LOGOUT</h3>
            </div>
        </div>
    </header>
    <main>
        <section>
            <div class="attendance">
                <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                    <ul class="attendance-ul">
                        <li>Year</li>
                        <li>Month</li>
                        <li>Status</li>
                        <li>Role</li>
                    </ul>
                    <button>SEE ATTENDANCE</button>
                </div>
                <div>
                    <table class="attendance-tb">
                        <tr>
                            <th style="font-weight: 650;">DATE</th>
                            <th style="width: 15%; font-weight: 650;">STATUS</th>
                            <th style="width: 60%; font-weight: 650;">NAME</th>
                        </tr>
                        <tr>
                            <td>2023 September 30</td>
                            <td>Present</td>
                            <td>John Doe</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="capstoneschedule">
                <div style="width: 100%;">
                    <table class="capstoneschedule-tb">
                        <tr>
                            <th style="font-weight: 650;">ID</th>
                            <th style="font-weight: 650;">DATE & TIME</th>
                            <th style="font-weight: 650;">CLASS</th>
                            <th style="font-weight: 650;">COURSE</th>
                        </tr>
                        <tr>
                            <td>00001</td>
                            <td>2080 September 30 20:20AM</td>
                            <td>BSCS 3-3</td>
                            <td>COSC 880</td>
                        </tr>
                    </table>
                </div>
                <form class="capstoneschedule-form">
                    <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                    <div class="capstoneschedule-input">
                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="id">ID</label>
                            <select style="width: 60%;">
                                <option value="0">Choose ID:</option>
                                <option value="1">00001</option>
                            </select>
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="date">DATE</label>
                            <input style="width: 60%;" type="date">
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="class">CLASS</label>
                            <input style="width: 60%; font-size: 1.4rem;" id="class" type="text" name="class" placeholder="Enter class..." required>
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="course">COURSE</label>
                            <input style="width: 60%; font-size: 1.4rem;" id="course" type="text" name="course" placeholder="Enter course..." required>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
</body>
</html>