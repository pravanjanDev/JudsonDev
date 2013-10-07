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
		var status = "approve";
		
		var deletedBatchCheckBoxList = document.getElementsByName("deleteBatchCheckBox");
		//alert(deletedBatchCheckBoxList.length);
		var deletedBatchRecurrenceIds = "";
		
		
		
		for(var index = 0; index < deletedBatchCheckBoxList.length; index++){
			//alert(deletedBatchCheckBoxList[index].checked);
			if(deletedBatchCheckBoxList[index].checked){
				//alert("comming nce"+deletedBatchCheckBoxList[index].id);
				deletedBatchRecurrenceIds += deletedBatchCheckBoxList[index].id + "," ; 
				if(batchImageList[deletedBatchCheckBoxList[index].id].status==status){
					$('#message').html("<B>Already in approve status</B>");
					$('#message').show();
					$('#message').fadeOut(50000);
					return;
				}
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
		
		
		
		if(deletedBatchRecurrenceIds!=null){
			
			$.ajax({type: 'POST', url: '/api/ImageUpload/updateImageStatus/v_0'  ,data:"deletedBatchRecurrenceIds="+deletedBatchRecurrenceIds, success: function(data){
				
				$('#message').html("<B>The image status is approve </B>");
				$('#message').show();
				$('#message').fadeOut(5000);
				ctreateJudsonImageTableAproveImage();
				
			}
			});
		}
		else{
			alert("Please select some id to delete");
		}
	}
	
	

	function rejectImageStatus(){
		
		var deletedBatchCheckBoxList = document.getElementsByName("deleteBatchCheckBox");
		var deletedBatchRecurrenceIds = "";
		
		for(var index = 0; index < deletedBatchCheckBoxList.length; index++){
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
		
		
		if(deletedBatchRecurrenceIds!=null){
			
			$.ajax({type: 'POST', url: '/api/ImageUpload/rejectImageStatus/v_0'  ,data:"deletedBatchRecurrenceIds="+deletedBatchRecurrenceIds, success: function(data){
				$('#message').html("<B>The image status is Rejected </B>");
				$('#message').show();
				$('#message').fadeOut(5000);
				getImageWithStatus();
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
		$('#message').html("Loading....");
		$('#message').show();
		$('#message').fadeOut(4000);
		
		$.ajax({type: 'GET', url: '/api/ImageUpload/getApproveImageWithRequestPagination/v_0' , success: function(data){
		    		
			if(data!=null){
				batchImageList = data;	
				if(batchImageList['Error'] =='Error'){
					alert("Please try again Server ");
					return;
				}
				console.log("i have got the information:"+batchImageList);
				if(batchImageList.success== false){
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
	
	
	function ctreateJudsonImageTablePendingImage(){
		  console.log("The user ");


		$("#approved").show();
		$('#message').html("<B>Loading ....</B>");
		$('#message').show();
		$('#message').fadeOut(4000);
		var paginationLimit = 0 ;
		
		$('#dvLoading').show();
		$.ajax
		  ({type: 'GET', url: '/api/ImageUpload/getImageWithRequestPagination/v_0?paginationLimit='+paginationLimit , success: function(data){
				$('#dvLoading').hide();

			  
			  if(data!=null){
				  batchImageList = data;	
				  if(batchImageList['Error'] =='Error'){
					  $('#message').html("<B>We have not fount any record ....</B>");
					  $('#message').show();
					  return;
				  }
				  else{
					  console.log("The user ");
					
					var updateImageTable =   $('.tab-scroll');
					$(updateImageTable).html("");
					  $.each(batchImageList, function(index, batchImageList) {
						  
						  var newTr = document.createElement("div");
						  
						  
						  $(newTr).addClass('divRow-img');
						  $(newTr).attr('id',batchImageList.imageId);
						  
						  var newtd1 = document.createElement("div");
						 
						  $(newtd1).addClass("divCell-th-mail");
						  var cb = document.createElement('input');
						  
						  cb.type = 'checkbox';
						  cb.name='deleteBatchCheckBox'
							  cb.id= batchImageList.imageId;
						 
						  $(newtd1).append(cb);
						 
							
						  var newtd2 = document.createElement("div");
						  $(newtd2).addClass("divCell-img");

						  
//						  $(anchor).attr('title','judson');
//						  $(anchor).addClass('fancybox');
//						  anchor.href=batchImageList.url;
						  
						  var img = new Image();
						  $(img).addClass('img-tab');
						  img.src=batchImageList.url;
						
						  img.setAttribute("onclick","loadIFrame('" + batchImageList.url + "')");
						 
						 
						  
//						  $(anchor).append(img);
						  $(newtd2).append(img);
						  
						  var newtd3 = document.createElement("div");
						  $(newtd3).addClass('divCell-img-des');
						  $(newtd3).html('<b>'+batchImageList.imageDescription+'</b>');
							
						 
						 var newtd4 = document.createElement("div");
						 $(newtd4).addClass('divCell-img-pend');
						 
						 
						 $(newtd4).html('Pending');
						 
						 $(newTr).append(newtd1);
						 $(newTr).append(newtd2);
						 $(newTr).append(newtd3);
						 $(newTr).append(newtd4);
						 updateImageTable.append(newTr);

					  
				  });
					
				  }
			  }
		  }
		  });
	}
	
	
	function ctreateJudsonImageTableAproveImage(){
		$('#message').html("<B>Loading ....</B>");
		$('#message').show();
		$('#message').fadeOut(4000);
		$('#dvLoading').show();

		var paginationLimit = 0 ;
		
		$.ajax
		  ({type: 'GET', url: '/api/ImageUpload/getApproveImageWithRequestPagination/v_1?paginationLimit='+paginationLimit , success: function(data){
				$('#dvLoading').hide();

			  
			  if(data!=null){
				  batchImageList = data;	
				  if(batchImageList['Error'] =='Error'){
					  $('#message').html("<B>We have not fount any record ....</B>");
					  $('#message').show();
					  return;
				  }
				  else{

					  $("#approved").hide();
					  var updateImageTable =   $('.tab-scroll');
					  $(updateImageTable).html("");
					  $.each(batchImageList, function(index, batchImageList) {
						  
						  var newTr = document.createElement("div");
						  
						  $(newTr).addClass('divRow-img');
						  $(newTr).attr('id',batchImageList.imageId);
						  
						  var newtd1 = document.createElement("div");
						 
						  $(newtd1).addClass("divCell-th-mail");
						  var cb = document.createElement('input');
						  
						  cb.type = 'checkbox';
						  cb.name='deleteBatchCheckBox'
							  cb.id= batchImageList.imageId;
						 
						  $(newtd1).append(cb);
						 
							
						  var newtd2 = document.createElement("div");
						  $(newtd2).addClass("divCell-img");

						  
//						  $(anchor).attr('title','judson');
//						  $(anchor).addClass('fancybox');
//						  anchor.href=batchImageList.url;
						  
						  var img = new Image();
						  $(img).addClass('img-tab');
						  img.src=batchImageList.url;
						
						  img.setAttribute("onclick","loadIFrame('" + batchImageList.url + "')");
						 
						 
						  
//						  $(anchor).append(img);
						  $(newtd2).append(img);
						  
						  var newtd3 = document.createElement("div");
						  $(newtd3).addClass('divCell-img-des');
						  $(newtd3).html('<b>'+batchImageList.imageDescription+'</b>');
							
						 
						 var newtd4 = document.createElement("div");
						 $(newtd4).addClass('divCell-img-pend');
						 
						 
						 $(newtd4).html('Approved');
						 
						 $(newTr).append(newtd1);
						 $(newTr).append(newtd2);
						 $(newTr).append(newtd3);
						 $(newTr).append(newtd4);
						
						 updateImageTable.append(newTr);
					  
				  });
					
					
					  
				  
		    		
			  }
		  }
		  }
		});
	}
	
	function getImageWithStatus(){
		
		console.log("insidefunctjion");
		var selectedOptionVal = $("#table-select-actions").val();
		console.log("The option value "+selectedOptionVal);
		
		if(selectedOptionVal=="pending"){
			ctreateJudsonImageTablePendingImage();
			
		}
		else if(selectedOptionVal=="approve"){
			ctreateJudsonImageTableAproveImage();
		}
		
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
	
	
	function loadAllcontact(){
		
		$('#message').html("<B>Loading ....</B>");
		$('#message').show();
		$('#message').fadeOut(4000);
		$('#dvLoading').show();

		var userList = null ;
		$.ajax
		  ({type: 'GET', url: '/api/ContactManageController/getAllcontact/v_0' , success: function(data){
				$('#dvLoading').hide();

			  
			  if(data!=null){
				  userList = data;	
				  if(userList['Error'] =='Error'){
					  $('#message').html("<B>We have not fount any record ....</B>");
					  $('#message').show();
					  return;
				  }
				  else{
					  

					  $("#approved").hide();
					  var updateImageTable =   $('#userContent');
					  $(updateImageTable).html("");
					  $.each(userList, function(index, userList) {
						  
						  var newTr = document.createElement("div");
						  
						  $(newTr).addClass('divRow');
						  $(newTr).attr('id',userList.userId);
						  
						  var newtd1 = document.createElement("div");
						 
						  $(newtd1).addClass("divCell-mail");
						  
						 
						  $(newtd1).html(userList.userEmail);
						 
							
						  var newtd2 = document.createElement("div");
						  $(newtd2).addClass("divCell-fname");
						  $(newtd2).html(userList.userFirstName);
						  
						  var newtd3 = document.createElement("div");
						  
						  $(newtd3).addClass('divCell-lname');
						  
						  $(newtd3).html(userList.userLastName);
							
						 
						 
						 
						 $(newTr).append(newtd1);
						 $(newTr).append(newtd2);
						 $(newTr).append(newtd3);
						
						
						 updateImageTable.append(newTr);
					  
				  });
					
					
					  
				  
		    		
			  }
		  }
		  }
		});
		
	}
	
	function loadIFrame(imageUrl)
	 {
		console.log("The image id  "+imageUrl);
	  window.open(imageUrl,"mywindow","width=550,height=550");
	  return false;
	 }

	
				