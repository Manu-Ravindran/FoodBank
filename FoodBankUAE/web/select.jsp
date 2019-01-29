<%-- 
    Document   : select
    Created on : 24 Nov, 2018, 10:48:01 PM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="js/jquery.min.js"></script>
<form id="myform">
<br/>
 <div class="container">
 <br>
 <div class="row">
   <div  class="col-xs-5">
    <label id="lblSel" style="color:green">----</Label>
    <input type="text" id="manu"/>
   </div>
  </div> 
  <br>
  <div class="row">
   <div class="col-xs-3">
    <select id="ddlEmployee" class="form-control">
    <option value="">-- Select --</option>
    <option value="1" data-city="Washington" data-doj="20-06-2011">John</option>
    <option value="2" data-city="California" data-doj="10-05-2015">Clif</option>
    <option value="3" data-city="Delhi" data-doj="01-01-2008">Alexander</option>
    <option value="4" data-city="Bangalore" data-doj="16-10-2005">Jack</option>
    <option value="4" data-city="Chennai" data-doj="18-12-2005">Anthony</option>
  </select>
   </div>
  </div>
 </div>
</form>

<script type="text/javascript">
$(document).ready(function () {

    $("#ddlEmployee").change(function () {
  var cntrol = $(this);
  
  var City = cntrol.find(':selected').data('city');
  var doj =  cntrol.find(':selected').data("doj");   
  document.getElementById('manu').value = City;
  
  
 });

});
</script>
</html>