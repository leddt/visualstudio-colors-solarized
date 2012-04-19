param ($type = "dark")

$solarizedColorsDark = @{
	'$Background' = '0x00362B00'; # Base03
	'$BackgroundHighlight' = '0x00423607'; # Base02
	'$SecondaryContent' = '0x00586E75'; # Base01
	'$MiddleGray' = '0x00837B65'; # Base00
	'$PrimaryContent' = '0x00969483'; # Base0
	'$EmphasizedContent' = '0x00A1A193'; #Base1
	'$Highlight1' = '0x00D5E8EE'; # Base2
	'$Highlight2' = '0x00E3F6FD'; #Base 3
	'$Yellow' = '0x000089B5';
	'$Orange' = '0x00164BCB';
	'$Red' = '0x002F32DC';
	'$Magenta' = '0x008236D3';
	'$Violet' = '0x00C4716C';
	'$Blue' = '0x00D28B26';
	'$Cyan' = '0x0098A12A';
	'$Green' = '0x00079A71';
}

$solarizedColorsLight = @{
	'$Background' = '0x00E3F6FD'; # Base3
	'$BackgroundHighlight' = '0x00D5E8EE'; # Base2
	'$SecondaryContent' = '0x00A1A193'; # Base1
	'$MiddleGray' = '0x00969483'; # Base0
	'$PrimaryContent' = '0x00837B65'; # Base00
	'$EmphasizedContent' = '0x00586E75'; # Base01
	'$Highlight1' = '0x00423607'; # Base02
	'$Hightlight2' = '0x00362B00'; # Base03
	'$Yellow' = '0x000089b5';
	'$Orange' = '0x00164BCB';
	'$Red' = '0x002F32DC';
	'$Magenta' = '0x008236D3';
	'$Violet' = '0x00C4716C';
	'$Blue' = '0x00D28B26';
	'$Cyan' = '0x0098A12A';
	'$Green' = '0x00079A71';
}

if ($type -eq "dark") {
	$hash = $solarizedColorsDark
} else {
	$hash = $solarizedColorsLight
}

# -delimiter "blah" is a way to force PowerShell to load it all as one string
$content = get-content -delimiter "nosuchthing" SettingsTemplate.xml

$hash.Keys | % {
	$content = $content.Replace($_, $hash[$_])
}

$content

	
