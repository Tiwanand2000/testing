Connect-AzAccount

$Location="North Europe"
$ResourceGroupName="web-demorg"
$AppServicePlanName="leaningappwebdemorg7001"
$AppName="leaningappwebdemov3"
Set-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Tier Standard

$AppName="leaningappwebdemov2"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName 

New-AzWebAppSlot -Name $AppName -ResourceGroupName $ResourceGroupName -Slot "staging"

$gitrepo="https://github.com/Tiwanand2000/testing"

$PropertiesObject = @{
    repoUrl = $gitrepo;
    branch ="main";
    isManualIntegration = "false";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
-ResourceName $AppName/staging/web -ApiVersion 2015-08-01 -Force