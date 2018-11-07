<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>CIS175</title>
<script type="text/javascript">
function validateForm()
{
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/names","root", "12qwaszX!");
	var userInput = document.inputForm.inputString.value;
	PreparedStatement stm = con.prepareStatement("INSERT INTO signups.names (Name) values ('" + userInput + "')");
    if(userInput == "")
    {
      	alert("Field cannot be blank.");
      	document.inputForm.inputString.focus();
      	return false;
    }
    else if(userInput.length<4)
    {
    	alert("Must be 4 or more characters.")
      	document.inputForm.inputString.focus();
      	return false;
    }
    else 
    {
    	stm.executeQuery();
    	alert("Registration successful.")
    	return true;
    }
}
</script>
</head>

<body>
<h1>Sign-up Form</h1>
<form name="inputForm" action="" method="post">
Enter string (4-12 characters): <input type="text" name="inputString" size="12">
<input type="submit" onClick="return validateForm();"/>
</form>
</body>

</html>