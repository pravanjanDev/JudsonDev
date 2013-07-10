<html>
<head>

<style type="text/css">
#message{display:none}
#message{color:blue;}

#ImageTable{display:none}
#ImageTable{
	color:Wheat;
	background-color:blue;
}

td{
text-align:center;
font-size: 1.2em;
height:27px;

}


</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="/css/manageMessagingSystem.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript"src="/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript"src="/js/BatchImage.js"></script>
	<script type="text/javascript" src="/js/jquery.dataTables_BatchImage.js"></script>
	<script type="text/javascript" src="/js/BatchImageConfiguration.js"></script>
	
</head>
  <body onload="getPendingImageForAdmim();">

		<table id="ImageTable" align="center" rules="groups" >
               <div id="message" style="position: absolute; z-index: 10; text-align:center;margin-left: 550px;"><B><center>Deleted sucessfully</center></B></div>  
    			<thead>
					<tr id="tr1">
					 	
					    <th>Update</th>
	 					<th>Image Name </th>
						<th>Image Type</th>
						<th>Image Status</th>
						<th>Show Image</th>
					
					</tr>
				</thead>
			
				<tbody align="center">
				
				</tbody>
				
		
			</table>
			
		<input type="button" value="Update Status" id="update" onclick="updateImageStatus()"><br><br>
		<input type="button" value="show All Approve Image" id="aprove" onclick="showAllApproveImage()"><br><br>
		<input type="button" value="show All Pending Image" id="aprove" onclick="getPendingImageForAdmim()"><br><br>

	</table>
  </body>
</html>