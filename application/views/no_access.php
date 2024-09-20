<?php

echo "<div style=\"color:red;font-size:25px;font-family:'Cairo';text-align:center;margin-top:250px\">" . $this->lang->line('error_no_permission_module'). (!empty($permission_id) ? ' (' . $permission_id . ')' : '') . "</div>"; 
echo "<div style=\"color:red;font-size:25px;font-family:'Cairo';text-align:center;margin-top:20px\" id=\"result\">سيتم تحويلك تلقائيا بعد</div>";
echo "<div id=\"countdown\" style=\"color:red;font-size:25px;font-family:'Cairo';text-align:center;margin-top:20px\" ></div>";
echo "
<script>
function pageRedirect() {
    window.location.replace(\"http://localhost/public/home\");
}      
setTimeout(\"pageRedirect()\", 5000);
var timeleft = 5;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
    document.getElementById(\"countdown\").innerHTML = \"Finished\";
  } else {
    document.getElementById(\"countdown\").innerHTML = timeleft;
  }
  timeleft -= 1;
}, 1000);
</script>
";
?> 