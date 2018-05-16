<!doctype html>
<head>
  <meta name="author" content="puravidaapps.com">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Test</title>
</head>

<body>
<button onClick="test();">Change Screen</button>
  <script>
  function test(){
    //document.write("The value from the app is<br />" + window.AppInventor.getWebViewString());
    window.AppInventor.setWebViewString("hello");
   //alert("hello");
  }
  </script>
</body>
</html>