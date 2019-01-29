<%-- 
    Document   : iframe
    Created on : 19 Nov, 2018, 7:48:45 PM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iframe Demo Page</title>
        <style>
            .iframe-container {
  overflow: hidden;
  padding-top: 56.25%;
  position: relative;
}

.iframe-container iframe {
   border: 0;
   height: 100%;
   left: 0;
   position: absolute;
   top: 0;
   width: 100%;
}
/* 4x3 Aspect Ratio */
.iframe-container-4x3 {
  padding-top: 75%;
}
        </style>
    </head>
    <body>
        <a href="index.html" target="one">click me</a>
        <div class="wrapper">
 <p>Resize me in your browser or pull me up in different size screen to see the magic of the <a href="https://benmarshall.me/resize-videos-proportionally-intrinsic-ratios/">intrinsic ratio technique</a>.</p>
  <div class="iframe-container">
    <iframe name="one" frameborder="0"></iframe>
  </div>
</div>
    </body>
</html>
