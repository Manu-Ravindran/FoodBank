<%-- 
    Document   : dynamicForm
    Created on : 19 Nov, 2018, 8:03:54 PM
    Author     : Sajid
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 20%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 40%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
</style>
</head>
<body>

<h2>Responsive Form</h2>
<p>Resize the browser window to see the effect. When the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other.</p>

<div class="container">
  <form action="/action_page.php">
    <div class="row">
      <div class="col-25">
        <label for="fname">CATEGORY</label>
      </div>
      <div class="col-75">
       <select id="country" name="country">
          <option value="australia">DRINKS</option>
          <option value="canada">DAIRY</option>
          <option value="usa">BAKERY</option>
          <option value="usa">READY TO EAT</option>
          <option value="usa">FRUITS & VEGETABLES</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">PRODUCT</label>
      </div>
      <div class="col-75">
        <select id="country" name="country">
          <option value="australia">DRINKS</option>
          <option value="canada">DAIRY</option>
          <option value="usa">BAKERY</option>
          <option value="usa">READY TO EAT</option>
          <option value="usa">FRUITS & VEGETABLES</option>
        </select>
      </div>
    </div>
      <div class="row">
      <div class="col-25">
        <label for="country">QUANTITY</label>
      </div>
      <div class="col-75">
          <input type="text" name="qty">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">UNIT</label>
      </div>
      <div class="col-75">
        <select id="country" name="country">
          <option value="australia">KG</option>
          <option value="canada">PACKS</option>
        </select>
      </div>
    </div>
    
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>

</body>
</html>
