<%@ page import="java.util.List" %>
<%@ page import="business.com.Student" %>
<%@ page import="business.com.Faculty" %>
<%@ page import="business.com.deadlines" %>
<%@ page import="business.com.Notifications" %>
<%@ page import="business.com.Grades" %>
<%
    @SuppressWarnings("unchecked")
    List<Grades> grades = (List<Grades>) request.getAttribute("grades");
%>
<%
    @SuppressWarnings("unchecked")
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<%
    @SuppressWarnings("unchecked")
    List<Faculty> faculty = (List<Faculty>) request.getAttribute("faculty");
%>
<%
    @SuppressWarnings("unchecked")
    List<deadlines> deadline = (List<deadlines>) request.getAttribute("deadline");
%>
<%
    @SuppressWarnings("unchecked")
    List<Notifications> notifications = (List<Notifications>) request.getAttribute("notifications");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Interface</title>
    <!-- Link to your CSS file -->
    <link rel="stylesheet" href="a_student.css">
</head>
<body>
    <header>
    <h1>FYP Portal</h1> <!-- FYP Portal title -->
    <nav class="navbar">
        <ul>
            <li><a href="#student-info">Student Info</a></li>
            <li><a href="#panel-members">Panel Members</a></li>
            <li><a href="#members">Group Members</a></li>
            <li><a href="#deadlines">Deadline</a></li>
            <li><a href="#grades">Grade</a></li>
        </ul>
        
    </nav>
</header>
    

    <div id="student-info" class="black-bg">
        <h2>Student Info</h2>
        <div class="student-info">
            <p><strong>Name:</strong> <%= request.getAttribute("studentName") %></p>
            <p><strong>Roll ID:</strong> <%= request.getAttribute("studentId") %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("studentEmail") %></p>
           <p><strong>Program:</strong> <%=request.getAttribute("studentprogram")%></p>
           <p><strong>Supervisor:</strong><%=request.getAttribute("supervisor") %></p>
          <p><strong>Project_Name:</strong> <%= request.getAttribute("Project_Name") %></p>
          
            <!-- Add more attributes if needed -->
        </div>
    </div>
 <div id="panel-members" class="white-bg">
    <h2>Panel Members</h2>
    <div class="panel-members">
        <% 
        if (faculty != null && !faculty.isEmpty()) {
            for (Faculty panelMember : faculty) {
        %>
        <div class="panel-member">
            <p><strong>Name:</strong> <%= panelMember.getFacultyName() %></p>
            <p><strong>Email:</strong> <%= panelMember.getEmail() %></p>
            <p><strong>Department:</strong> <%= panelMember.getDepartment() %></p>
        </div>
        <% 
            }
        } else {
        %>
        <p>No panel members found</p>
        <% } %>
    </div>
</div>
  <div id="members" class="black-bg">
        <h2>Members</h2>
        <div class="members">
            <% 
            if (students != null && !students.isEmpty()) {
                for (Student student : students) {
            %>
            <div class="member">
                <p><strong>Name:</strong> <%= student.getStudentName() %></p>
                <p><strong>Role:</strong> <%= student.getStudentId() %></p>
            </div>
            <% 
                }
            } else {
            %>
            <p>No members found</p>
            <% } %>
        </div>
    </div>
 <div id="deadlines" class="white-bg">
    <h2 class="section-title">Deadlines</h2> <!-- Title for the deadlines section -->
    <div class="tasks">
        <!-- Iterate over the list of deadlines and display each deadline -->
        <% 
        if (deadline != null && !deadline.isEmpty()) {
            for (deadlines d : deadline) {
        %>
        <div class="task">
            <div class="task-info">
                <p><strong>Type:</strong> <%= d.getType() %></p>
                <p><strong>Deadline Date:</strong> <%= d.getDeadlineDate() %></p>
                <p><strong>Status:</strong> <%= d.getStatus() %></p>
            </div>
        </div>
        <% 
            }
        } else {
        %>
        <p>No deadlines found</p>
        <% } %>
    </div>
</div>
 
               
    <div id="grades" class="black-bg">
    <h2 class="section-title">Grades</h2> <!-- Centered title for the grade section -->
    <div class="grade-dropdown">
        <button onclick="toggleDashboard()">View Grades</button> <!-- Dropdown button -->
        <div id="dashboard" class="dashboard" style="display: none;"> <!-- Dashboard section -->
            <div class="dashboard-row header">
                <div class="column">Task</div>
                <div class="column">Grade</div>
                <div class="column">Comment</div>
                <div class="column">Submission Date</div>
            </div>
            <!-- Iterate over the list of grades and display each grade -->
            <%
           
            if (grades != null && !grades.isEmpty()) {
                for (Grades grade : grades) {
            %>
            <div class="dashboard-row">
                <div class="column"><%= grade.getTask() %></div>
                <div class="column"><%= grade.getLetterGrade() %></div>
                <div class="column"><%= grade.getComment() %></div>
                <div class="column"><%= grade.getSubmissionDate() %></div>
            </div>
            <%
                }
            } else {
            %>
            <div class="dashboard-row">
                <p>No grades found</p>
            </div>
            <%
            }
            %>
        </div>
    </div>
</div>
    
    <!-- Other sections of your HTML content -->
     <div id="notifications" class="white-bg">
            <h2 class="section-title">Notifications</h2> <!-- Title for the notifications section -->
            <div class="notifications">
                <!-- Iterate over the list of notifications and display each notification message -->
                <%
               
                if (notifications != null && !notifications.isEmpty()) {
                    for (Notifications notification : notifications) {
                %>
                <div class="notification">
                    <p><strong>Message:</strong> <%= notification.getMessage() %></p>
                    <p><strong>Timestamp:</strong> <%= notification.getTimestamp() %></p>
                </div>
                <%
                    }
                } else {
                %>
                <p>No notifications found</p>
                <%
                }
                %>
            </div>
        </div>
    

    <script>
        // Function to toggle dashboard visibility
        function toggleDashboard() {
            var dashboard = document.getElementById("dashboard");
            if (dashboard.style.display === "none") {
                dashboard.style.display = "block";
            } else {
                dashboard.style.display = "none";
            }
        }
        <!-- Notifications Section -->
       
    </script>

</body>
</html>
