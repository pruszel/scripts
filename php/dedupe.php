<?php
$fh = fopen($argv[1], "r");
if ($fh)
{
	$uniqueLines = [];
	while (!feof($fh)) {
		$line = trim(fgets($fh));
		if ($line === "") {
			continue;
		}
		$uniqueLines[$line] = 0;
	}
	fclose($fh);

	foreach ($uniqueLines as $key => $value) {
		echo $key, PHP_EOL;
	}
}