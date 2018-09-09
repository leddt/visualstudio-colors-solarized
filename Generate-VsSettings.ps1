function Generate-VsSettings {
<#
	.SYNOPSIS
	Generate-VsSettings creates a .vssetting file using the Solarized
	color pallette created by Ethan Schoonover.  

	.DESCRIPTION
	The Solarized palette was designed by Ethan Schoonover for maximum readability 
	and contrast. The color choices were chosen based on the highlighting colors
	listed in the canonical Vim implementation. For more information see 
	http://ethanschoonover.com/solarized

	To customize the colors from the default, adjust the color values
	in the script or in the accompanying SettingsTemplate.xml file. Please 
	note that .vssettings file use a different ordering for the ARGB color 
	sequence, so #002B36 (Based03) becomes 0x00362B00.
	
	To generate the .vssettings file, you should pipe the output of the script
	to out-file and specify UTF-8 encoding

	.PARAMETER type
	Specifies the light or dark version of the theme.

	.PARAMETER TemplatePath
	Specifies the path to the template file to use when generating the output.

	.EXAMPLE
	Generate-VsSettings -type light | Out-File -Encoding utf8 -FilePath solarized-light.vssettings

	.OUTPUTS
	System.String - a string containing the .vssettings XML
#>
	param (
		$type = "dark",
		$TemplatePath = 'SettingsTemplate.xml'
	)

	$solarizedColorsDark = @{
		'$Background' = '0x00362B00'; # Base03
		'$BgHighlight' = '0x00423607'; # Base02
		'$SecondaryContent' = '0x00756E58'; # Base01
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
		'$Green' = '0x00009985';
	}

	$solarizedColorsLight = @{
		'$Background' = '0x00E3F6FD'; # Base3
		'$BgHighlight' = '0x00D5E8EE'; # Base2
		'$SecondaryContent' = '0x00A1A193'; # Base1
		'$MiddleGray' = '0x00969483'; # Base0
		'$PrimaryContent' = '0x00837B65'; # Base00
		'$EmphasizedContent' = '0x00756E58'; # Base01
		'$Highlight1' = '0x00423607'; # Base02
		'$Highlight2' = '0x00362B00'; # Base03
		'$Yellow' = '0x000089B5';
		'$Orange' = '0x00164BCB';
		'$Red' = '0x002F32DC';
		'$Magenta' = '0x008236D3';
		'$Violet' = '0x00C4716C';
		'$Blue' = '0x00D28B26';
		'$Cyan' = '0x0098A12A';
		'$Green' = '0x00009985';
	}

	if ($type -eq "dark") {
		$hash = $solarizedColorsDark
	} else {
		$hash = $solarizedColorsLight
	}

	# -delimiter "nosuchthing" is a way to force PowerShell to load it all as one string
	$content = get-content -delimiter "nosuchthing" $TemplatePath

	$hash.Keys | % {
		$content = $content.Replace($_, $hash[$_])
	}

	$content
}

$thisFileLocation = Split-Path $MyInvocation.MyCommand.Path -Parent
Get-Item -Path "$thisFileLocation\*\generator\SettingsTemplate.xml" |
	ForEach-Object {
		$outputDirectory = $_.Directory.Parent.FullName;
		Generate-VsSettings -type light -TemplatePath $_ | Out-File -Encoding utf8 -FilePath $outputDirectory\solarized-light.vssettings;
		Generate-VsSettings -type dark  -TemplatePath $_ | Out-File -Encoding utf8 -FilePath $outputDirectory\solarized-dark.vssettings;
		$outputDirectory.Name
	}

