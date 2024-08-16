Connect-AzAccount

$Location="North Europe"
$ResourceGroupName="web-demorg"
$AppServicePlanName="leaningappwebdemorg7001"

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Location $Location -Tier Free -Linux

$AppName="leaningappwebdemo16Aug24v1"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName 

$gitrepo="https://github.com/Tiwanand2000/testing"

$PropertiesObject = @{
    repoUrl = $gitrepo;
    branch ="testingv1";
    isManualIntegration = "false";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $AppName/web -ApiVersion 2015-08-01 -Force