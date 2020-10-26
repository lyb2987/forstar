<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
  
<script type="text/javascript">
$(function(){
$('#roomNum').change(function(){
		
	});
	
	$(document).on('change','#roomNum',function(e){
		
		$.ajax({
			type:"POST",
			url : "/room/roomclist",
			cache : false,
			data : {"num" : $("#roomNum").val()},
			datatype : "html",
			success : function(data){
				$("#openroom").html(data);
			},
			error : function( jqXHR, textStatus, errorThrown  ) {
				alert( jqXHR.status );
				
			}
		});
		});
	
});
</script>


		<select id="roomNum" name="roomNum">
		<option value="">---예약가능객실---</option>
		<c:forEach items="${orlist }" var="openroom" >
		<option value="${openroom.roomNum}">${openroom.roomNum }호</option>
		</c:forEach>
		</select>
        <div id="openroom"></div>
