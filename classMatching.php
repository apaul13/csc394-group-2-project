<? php

add_shortcode('class-match', 'classMatch');
function classMatch() {
  global $wpdb;
  $classResults = $wpdb -> get_results("SELECT * FROM Class_List");
  $jobResults = $wpdb -> get_results("SELECT * FROM Jobs");
  $classSkillsDict = array();


  //create the classSkills dictionary
  foreach ($classResults as $row) {
	//$currentClass = ;
	$classSkillsList = explode(',', $row -> SkillsLearned);
	$classSkillsDict[$row -> ClassID] = $classSkillsList;
  }

  //compare job's skills with every classes skills, and append that class if it matches at least 1 skill
  foreach ($jobResults as $row) {
	$jobSkills = explode(',', $row -> SkillsRequired);
	$tempClassList = array();
	foreach($classSkillsDict as $key => $value) {
		foreach($value as $item) {
		 	if (in_array($item, $jobSkills)) {
			  if (!in_array($key, $tempClassList)) {
			  	array_push($tempClassList, $key);
			  }
			}
		}
	}

	//print the list of jobs and classes associated with them
	echo "<h1>" . $row -> JobName . "</h1>";
	foreach($tempClassList as $item) {
	  $classDesc = $wpdb -> get_row("SELECT Class_Description FROM Class_List WHERE ClassID = '".$item."'");
	  ?>
		<p font-size=20px> <?php echo $item . " (" . $classDesc -> Class_Description . ")"; ?></p>
		<?php
	}
  }

}
