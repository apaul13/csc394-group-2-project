<?php

add_shortcode('job-match', 'jobMatch');

function jobMatch() {
  global $wpdb;
  $currentUser = wp_get_current_user();
  $userTableQuery = "SELECT * FROM UserID" . $currentUser -> ID . "_skills_table";
  $userTableResults = $wpdb -> get_results($userTableQuery);
  if (count($userTableResults) == 0) {
	echo "You haven't added any skills!<br>";
	echo "<a href='http://michaeld1.sgedu.site/Group_2/account/'>Click here to add skills</a>";
	return;
  }

  $jobResults = $wpdb -> get_results("SELECT JobName, SkillsRequired FROM Jobs");
  $jobSkillsDict = array();

  foreach($jobResults as $row) {
	$jobSkillsList = explode(',', $row -> SkillsRequired);
	$jobSkillsDict[$row -> JobName] = $jobSkillsList;
  }

   $jobMatchNumDict = array();
  foreach($jobSkillsDict as $key => $value) {
	  $jobMatchNumDict[$key] = 0;
  }

  foreach($userTableResults as $row) {
	$currentSkill = $row -> skill_name;
	foreach($jobSkillsDict as $key => $value) {
	  foreach($value as $skill) {
		if (strcmp(trim($skill), trim($currentSkill)) == 0) {
		  $jobMatchNumDict[$key] +=  1;
		}
	  }
	}
  }

  array_multisort($jobMatchNumDict, SORT_DESC);
  foreach($jobMatchNumDict as $key => $value) {
	if($value != 0) {
	  echo "<h1>" . $key . "</h1><br>";
	  echo "<p> You match on " . $value . " skills</p>";
	  echo "<hr><br>";
	}
	if($value == 1) {
	  echo "<h1>" . $key . "</h1><br>";
	  echo "<p> You match on " . $value . " skill</p>";
	  echo "<hr><br>";
	}
  }
}
