# Range les documents du portfolio sous des noms simples, compatibles GitHub Pages.
# Les fichiers sont COPIÉS : les originaux restent en place. Une fois le site vérifié,
# tu peux supprimer les anciens dossiers (tp 1,2,3 / script / CNIL Certif / synthese et cv).
# Lancement : clic droit sur ce fichier > "Exécuter avec PowerShell",
# depuis le dossier du portfolio (celui qui contient index.html).
# Le CV n'est pas dans la liste : sa nouvelle version est déjà fournie dans docs/.

Set-Location -LiteralPath $PSScriptRoot
$fichiers = [ordered]@{
    'tp 1,2,3/Documentation TP 1.pdf' = 'docs/tp1-pfsense.pdf'
    'tp 1,2,3/Documentation TP 2 (1).pdf' = 'docs/tp2-dhcp-dns.pdf'
    'tp 1,2,3/Documentation TP 3.pdf' = 'docs/tp3-active-directory.pdf'
    'script/script DHCP-AD-DNS Services.txt' = 'docs/script-ad-dns-dhcp.txt'
    'CNIL Certif/Certificat_1 CNIL.pdf' = 'docs/cnil/cnil-module-1.pdf'
    'CNIL Certif/Certificat_2 CNIL.pdf' = 'docs/cnil/cnil-module-2.pdf'
    'CNIL Certif/Certificat_3 CNIL.pdf' = 'docs/cnil/cnil-module-3.pdf'
    'CNIL Certif/Certificat_4 CNIL.pdf' = 'docs/cnil/cnil-module-4.pdf'
    'CNIL Certif/Certificat_5 CNIL.pdf' = 'docs/cnil/cnil-module-5.pdf'
    'CNIL Certif/Certificat_6 CNIL.pdf' = 'docs/cnil/cnil-attestation-finale.pdf'
    'synthese et cv/8-1 - BTS SIO - 2025 - Annexe 8-1 - Epreuve E5 - Tableau de synthese.pdf' = 'docs/tableau-de-synthese.pdf'
}

$ok = 0; $manquants = @()
foreach ($source in $fichiers.Keys) {
    $cible = $fichiers[$source]
    if (Test-Path -LiteralPath $source) {
        $dossier = Split-Path -Parent $cible
        if ($dossier) { New-Item -ItemType Directory -Force -Path $dossier | Out-Null }
        Copy-Item -LiteralPath $source -Destination $cible -Force
        Write-Host "OK      $source  ->  $cible" -ForegroundColor Green
        $ok++
    } else {
        Write-Host "ABSENT  $source" -ForegroundColor Yellow
        $manquants += $source
    }
}
Write-Host ""
Write-Host "$ok fichier(s) copié(s)."
if ($manquants.Count -gt 0) {
    Write-Host "Fichiers introuvables (vérifie leur nom exact) :" -ForegroundColor Yellow
    $manquants | ForEach-Object { Write-Host "  - $_" }
}
Read-Host "Appuie sur Entrée pour fermer"
