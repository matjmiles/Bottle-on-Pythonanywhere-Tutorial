<h2>Below are a list of users</h2>
<table border="1">
  <tr>
    <td><strong>ID</strong></td>
     <td><strong>First Name</strong></td>
     <td><strong>Last Name</strong></td>
  </tr>

%# The % signs mark the beginning and end of python code.
%# The rows object is a recordset.
%# The row ojbect is a row in the recordset
%# The {{ }} outputs data from the row to the screen
%# The row[0] means the first column in the row and so on

%for row in rows:
  <tr>
    <td>{{row[0]}}</td>
     <td>{{row[1]}}</td>
     <td>{{row[2]}}</td>
  </tr>
%end

</table>
<div style="padding-top: 15px">
<a href="/create_user"><h3>Add a New User<h3></a>
</div>