param($installPath, $toolsPath, $package, $project)

function SetCopyAction($project, $fileName)
{
	$path = $fileName -split "/"

	$currentItem = $project
	
	foreach($level in $path)
	{
		$currentItem = $currentItem.ProjectItems.Item($level)
	}
	
    # set 'Copy To Output Directory' to 'Copy if newer'
    $copyToOutput = $currentItem.Properties.Item("CopyToOutputDirectory")
    $copyToOutput.Value = 1

    # set 'Build Action' to 'Content'
    $buildAction = $currentItem.Properties.Item("BuildAction")
    $buildAction.Value = 2
}

$fileNames = @("Assemblies/log4net/log4net.umbraco.dll") 
foreach($filename in $fileNames)
{
    SetCopyAction $project $filename
}