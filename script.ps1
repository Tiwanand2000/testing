Connect-AzAccount

$Location="North Europe"
$ResourceGroupName="web-demorg"
$AppServicePlanName="leaningappwebdemorg7000"

$AppName="leaningappwebdemorg"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName

$gitrepo="https://github.com/Tiwanand2000/AZ-204Learning.git"

$PropertiesObject = @{
    repoUrl = $gitrepo;
    branch ="main";
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $AppName/web -ApiVersion 2015-08-01 -Force