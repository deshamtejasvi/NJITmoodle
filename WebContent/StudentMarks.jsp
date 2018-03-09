
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript" src="resources/jsFiles/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="resources/jsFiles/jquery-ui.js"></script>
<script type="text/javascript" src="resources/jsFiles/jquery-ui-i18n.js"></script>
<script type="text/javascript" src="./resources/jsFiles/selecter.js"></script>
<script type="text/javascript">
jQuery(function(){
    var counter = 1;
    jQuery('a.add').click(function(event){
        event.preventDefault();

        var newRow = jQuery('%><tr><td><input type="text" name="type' +
            counter + '"/></td><td><input type="text" name="marks' +
            counter + '"/></td><td><input type="text" name="percentage' +
            counter + '"/></td></tr>');
            counter++;
        jQuery('table.CourseWork').append(newRow);

    })};
 </script>   
<head>
</head>

<body>
<%@ page import="java.sql.*"%>
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <table border="1" class="CourseWork"> <caption>COURSEWORK</caption> 
                <tr> <th>TYPE</th> <th>TOTALMARKS</th><th>PERCENTAGE</th> </tr>
                <tr><th><input type="text" name="type" id="type"></th>
                <th><input type="text" name="marks" id="marks"></th>
                <th><input type="text" name="percentage" id="percentage"></th></tr>
				</table>
				<a href="#" title="" class="add">Add </a>
				<% 
				%>
			</div>			

		</div>

    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
               