$solarizedColorsDark = @{
	'$Base03' = '0x00362B00';
	'$Base02' = '0x00423607';
	'$Base01' = '0x00586E75';
	'$Base00' = '0x00837B65';
	'$Base0' = '0x00969483';
	'$Base1' = '0x00A1A193';
	'$Base2' = '0x00D5E8EE';
	'$Base3' = '0x00E3F6FD';
	'$Yellow' = '0x000089B5';
	'$Orange' = '0x00164BCB';
	'$Red' = '0x002F32DC';
	'$Magenta' = '0x008236D3';
	'$Violet' = '0x00C4716C';
	'$Blue' = '0x00D28B26';
	'$Cyan' = '0x0098A12A';
	'$Green' = '0x00079A71';
}

# Light is the same as dark with the base values inverted
$solarizedColorsLight = @{
	'$Base3' = '0x00362B00';
	'$Base2' = '0x00423607';
	'$Base1' = '0x00586E75';
	'$Base0' = '0x00837B65';
	'$Base00' = '0x00969483';
	'$Base01' = '0x00A1A193';
	'$Base02' = '0x00D5E8EE';
	'$Base03' = '0x00E3F6Fd';
	'$Yellow' = '0x000089b5';
	'$Orange' = '0x00164BCB';
	'$Red' = '0x002F32DC';
	'$Magenta' = '0x008236D3';
	'$Violet' = '0x00C4716C';
	'$Blue' = '0x00D28B26';
	'$Cyan' = '0x0098A12A';
	'$Green' = '0x00079A71';
}

$content = get-content -delimiter "nosuchthing" SettingsTemplate.xml
$hash = $solarizedColorsDark

$hash.Keys | % {
	$content = $content.Replace($_, $hash[$_])
}

$content

	
