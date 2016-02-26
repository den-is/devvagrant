<?php
  // Show running user
  echo 'User: ' . system('whoami') . '</br>';
  echo 'Datetime: ' . date("Y/m/d h:i:sa") . '</br>';
  // Show all information, defaults to INFO_ALL
  phpinfo();
  // phpinfo(INFO_MODULES);
?>
