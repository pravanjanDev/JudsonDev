var batchImageList = null;
var viewListofNumber = [] ;
var completeListNumber = [];
var currentviewList =[];
var searchView =[];

var prevFlag = false ;
var nextFlag = false;





function getPendingImageForAdmim(){
	//alert("i am here ");
	$('#message').html("<B>Please wait while we process your request ....</B>");
	$('#message').show();
	$('#message').fadeOut(4000);
	
	$.ajax
	  (
	    {type: 'GET', url: '/api/ImageUpload/getImageWithRequestPagination/v_0' , success: function(data){
	    		
	    	//alert(data);
			
	    	if(data!=null){
	    			
	    		batchImageList = data;	
	    		if(batchImageList['Error'] =='Error'){
	    			alert("Please try again Else report it to FormCreator ");
	    			return;
	    		}
	    		if(batchImageList.success== false){
	    			//structingBatchMessageInRowWithJtable(batchImageList);
	    			Jdatatable.fnClearTable();
		    		alert("The request reached End of record Next request will pull the request from beigning");
	    		}
	    		else{
		    		console.log("i have got the information:"+batchImageList);
		    		structingBatchMessageInRowWithJtable(batchImageList);
		    		$('#ImageTable').show();
		    		
		    	}
	    	}
	    	
	    }
	    });
	}
	
	function structingBatchMessageInRowWithJtable(batchImageList){
		var newRow = new Array();
		
		Jdatatable= $('#ImageTable').dataTable( {
		   "bProcessing": true,		
			"bFilter": false,
		 	"sPaginationType": "full_numbers", 
			"bLengthChange": false,
			"bInfo": true,
			"bDestroy":true,
			"bSort":false,
			"aaSorting": [[ 0, "asc" ]],
			"bJQueryUI": false,
			"bAutoWidth" : false,
		   "aoColumns" :	[ 
			        
		                	    {"sWidth": "50px"},
			                	{ "sWidth": "350px" },   
			                	{ "sWidth": "350px" },
			                	
			                	{ "sWidth": "350px" },
			                	{ "sWidth": "200px" }
							]
		});
	
		var dataIndex = 0;
		var songname;
	   $.each(batchImageList, function(index, batchImageList) {
		  
		   newRow[0]="<input name='deleteBatchCheckBox' type='checkbox' id='" + batchImageList.imageId + "' value='Deleterow'>";
		  
		   var imageName = batchImageList.title;
		   newRow[1] =imageName;
				
		   var imageType1= batchImageList.imageType;
		   newRow[2]=imageType1;
		   
		   var batchStatus = batchImageList.status;
		   newRow[3]=batchStatus;			
		  
		   newRow[4]="<input name='showImage' type='button' id='" + batchImageList.imageId + "' value='ShowImage' onclick='showImageonclick(\""+batchImageList.imageId+"\", " + dataIndex + ")'>";
				
	   
		   Jdatatable.fnAddData(newRow, true); 				
		   dataIndex++;
	});
	   
   }
	function copyArray(fromList, toList){
		for(index in fromList){
			toList[index] = fromList[index];
		}
		return toList;
	}
	
	
	function updateImageStatus(){
		var deletedBatchCheckBoxList = document.getElementsByName("deleteBatchCheckBox");
		//alert(deletedBatchCheckBoxList.length);
		var deletedBatchRecurrenceIds = "";
		
		for(var index = 0; index < deletedBatchCheckBoxList.length; index++){
			//alert(deletedBatchCheckBoxList[index].checked);
			if(deletedBatchCheckBoxList[index].checked){
				deletedBatchRecurrenceIds += deletedBatchCheckBoxList[index].id + "," ; 
			}
		}
		if(deletedBatchRecurrenceIds == ""){
			$('#message').html("<B>Please select a record under Update Tab</B>");
			$('#message').show();
			$('#message').fadeOut(50000);
			return;   		
		}
		var userConfirm = confirm("Do you want to update image status ?");
		if(userConfirm == false){
			return;
	  	   
		}
		
		$('#message').html("<B>Please Wait....</B>");
		$('#message').show();
		$('#message').fadeOut(2000);
		
		
		
		var map = new Object();
		
		editedBatch = null;
		editedRaw = null;
		editschedulBehaviourList=null;
		   	
		deleteidArrays = deletedBatchRecurrenceIds.split(",");
		for(var index = 0; index < deleteidArrays.length; index++){
			if(document.getElementById(deleteidArrays[index]) != null){
				Jdatatable.fnDeleteRow(document.getElementById(deleteidArrays[index]).parentNode.parentNode, null, true);
				batchImageList[deleteidArrays[index]] = null;
			}
		}
		console.log(deleteidArrays);
		if(deleteidArrays!=null){
			$.ajax({type: 'POST', url: '/api/ImageUpload/updateImageStatus/v_0'  ,data:"deletedBatchRecurrenceIds="+deletedBatchRecurrenceIds, success: function(data){
				$('#message').html("<B>Updated Successfully</B>");
				$('#message').show();
				$('#message').fadeOut(2000);
		   			
			}
			});
		}
		else{
			alert("Please select some id to delete");
		}
	}
	
	function showImageonclick(url){
		$('#message').html("<B>Please wait while we process your request....</B>");
		$('#message').show();
		$('#message').fadeOut(5000);
		
		
		
		myWindow=window.open(url,'','width=600,height=400');
		
		
		

	}
	
	
	function showAllApproveImage(){
		
		$('#message').html("<B>Please wait while we process your request ....</B>");
		$('#message').show();
		$('#message').fadeOut(4000);
		
		$.ajax
		  (
		    {type: 'GET', url: '/api/ImageUpload/getApproveImageWithRequestPagination/v_0' , success: function(data){
		    		
		    	
		    	
				
		    	if(data!=null){
		    			
		    		batchImageList = data;	
		    		if(batchImageList['Error'] =='Error'){
		    			alert("Please try again Else report it to FormCreator ");
		    			return;
		    		}
		    		console.log("i have got the information:"+batchImageList);
		    		if(batchImageList.success== false){
		    			//structingBatchMessageInRowWithJtable(batchImageList);
		    			Jdatatable.fnClearTable();
			    		alert("The request reached End of record Next request will pull the request from beigning");
		    		}
		    		else{
			    		console.log("i have got the information:"+batchImageList);
			    		Jdatatable.fnClearTable();
			    		structingBatchMessageInRowWithJtable(batchImageList);
			    		$('#ImageTable').show();
			    		
			    	}
		    	}
		    }
		    });
		}
	
	
	
	
	function resetThis(oneEvent){
		$("#"+oneEvent.id).val("");
		
		//alert("This si"+oneEvent.id);
	}
	
	function uploadImageFile(){
		$('#message').html("<B>Please Wait...While We upload you Image.</B>");
		$('#message').show();
		$('#message').fadeOut(1000);
		var title = $("#imageTitle").val();
		var imageFile = $("#imagefile").val();
		var imageDescription = $("#imageDescription").val();
		if(imageDescription=="" || title ==""|| imageFile ==""){
			$('#message').html("<B>Please provide the value correctly</B>");
			$('#message').show();
			//$('#message').fadeOut(70000);
			return ;
			
		}
	
	    var file_data = $("#imagefile").prop("files")[0];   // Getting the properties of file from file field
	    var form_data = new FormData();                  // Creating object of FormData class
	    form_data.append("imagefile", file_data)              // Appending parameter named file with properties of file_field to form_data
	    form_data.append("imageDescription", imageDescription)
	    form_data.append("title", title)
	    
	  
	    $.ajax({url: "/api/ImageUpload/uploadImage/v_1",
	                dataType: 'script',
	                cache: false,
	                contentType: false,
	                processData: false,
	                data: form_data,                         
	                type: 'post',
	                success: function(result){
	                	
	                	
	                	 console.log(result);
	                }
	               
	       })
	    $('#message').html("<B>Image has uploaded Successfully</B>");
		$('#message').show();
		$('#message').fadeOut(2000);
		
		$("#imageTitle").val("");
		$("#imageDescription").val("");
		$("#imagefile").val(""); 
	}
	
	
	function ctreateJudsonImageTable(){
		$('#message').html("<B>Please wait while we process your request ....</B>");
		$('#message').show();
		$('#message').fadeOut(4000);
		
		$.ajax
		  ({type: 'GET', url: '/api/ImageUpload/getImageWithRequestPagination/v_0' , success: function(data){
			  
			  if(data!=null){
				  batchImageList = data;	
				  if(batchImageList['Error'] =='Error'){
					  alert("Please try again Else report it to FormCreator ");
					  return;
				  }
				  else{
					  
					  var uploadTable = $('#judsonImageTableBody');
					  $('#judsonImageTableBody').html("");
					  
					  $.each(batchImageList, function(index, batchImageList) {
					  
						
						
						var newTr = document.createElement("tr");
						newTr.setAttribute('onclick','viewImageDetail("'+batchImageList.imageId+'")');
						newTr.setAttribute('onmouseover','changecolour("'+batchImageList.imageId+'")');
						newTr.setAttribute('onmouseout','againchange("'+batchImageList.imageId+'")');
						

						newTr.setAttribute('onmouseover','');
						
						var title = document.createElement("td");
						$(title).html('<b>'+batchImageList.title+'</b>');
						var imageDescription = document.createElement("td");
						$(imageDescription).html('<b>'+batchImageList.imageDescription+'</b>');
						
						var imageType = document.createElement("td");
						$(imageType).html('<b>'+batchImageList.imageType+'</b>');
						
						var changeStatus = document.createElement("td");
						changeStatus.setAttribute('onclick','updateImageStatus("'+batchImageList.imageId+'")');
						$(changeStatus).html(batchImageList.status);

						$(newTr).append(title);
						$(newTr).append(imageDescription);
						$(newTr).append(imageType);
						$(newTr).append(changeStatus);
						uploadTable.append(newTr);
					  
				  });
		    		
			  }
		  }
		  }
		});
	}
	
	

	
	
	
	function viewImageDetail(batchImageid){
		
		//alert(innercontent.imageId);
	 var imageTitle= batchImageList[batchImageid].title;
	 var imageDescription= batchImageList[batchImageid].imageDescription;


		window.location = "/jsp/JudsonUpload.jsp?batchImageid="+batchImageid+"&imageTitle="+imageTitle+"&imageDescription="+imageDescription+"&Imageurl="+batchImageList[batchImageid].url;

	}
	
	function changecolour(id){
		$('#'+id).css("background-color","blue");

		
	}
	function againchange(id){
		$('#'+id).css("background-color","transparent");
	}
	
	
	
				