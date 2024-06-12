# Conectar ao azure
Connect-AzAccount

# Criar Grupo de Recursos
New-AzResourceGroup -Name nome-ao-grupo -Location localização-desejada

# Lista grupos de recursos
Get-AzResourceGroup

# Informacoes sobre um grupo de recursos
Get-AzResourceGroup -Name nome-do-grupo-recursos

# Excluir grupo de recursos
Remove-AzResourceGroup -Name nome-do-grupo-recursos

# Lista os storages account com nome, localização e grupo de recurso
Get-AzStorageAccount | Select StorageAccountName, Location, ResourceGroupName

# Criando parametros
$localizacao = "brazilsouth"
$rg = "az-storage"
$storage = "storagesatakepowershell"
$sku = "Standard_LRS"

# Cria a conta no storage account
New-AzStorageAccount -ResourceGroupName $rg -Name $storage -Location $localizacao -SkuName $sku

# Setar um storage para uso
$storageaccount = Set-AzCurrentStorageAccount -ResourceGroupName $rg -Name $storage

# Criar o container, após o storage setado
$container = "containerps"
New-AzStorageContainer -Name $container -Permission Container

# Fazer upload de arquivos para container blob
Set-AzStorageBlobContent -Container $container -File caminho-do-arquivo-local -Blob "nome-ao-arquivo"
