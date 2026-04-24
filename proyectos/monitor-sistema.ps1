while ($true) {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $mem = (Get-Counter '\Memory\% Committed Bytes In Use').CounterSamples.CookedValue
    $disk = (Get-Counter '\LogicalDisk(C:)\% Disk Time').CounterSamples.CookedValue
    
    Write-Host "----------------------------------------"
    Write-Host "Estado del sistema (refresca cada 2 seg):"
    Write-Host "----------------------------------------"
    Write-Host "CPU:  $([Math]::Round($cpu, 1))%   |  Estado: $(if($cpu -lt 50) { "✅ Estable" } else { "⚠️ Alto" })"
    Write-Host "Memoria: $([Math]::Round($mem, 1))% |  Estado: $(if($mem -lt 60) { "✅ Estable" } else { "⚠️ Alto" })"
    Write-Host "Disco: $([Math]::Round($disk, 1))%  |  Estado: $(if($disk -lt 15) { "✅ Estable" } else { "⚠️ Alto" })"
    Write-Host "----------------------------------------"
    
    # Señales de estabilidad para tu entorno de Walmart
    if ($cpu -lt 50 -and $disk -lt 15) {
        Write-Host "`n✅ Sistema estable para trabajar:" -ForegroundColor Green
        Write-Host "   - Outlook debería responder sin trabos"
        Write-Host "   - Puedes abrir JIRA/Confluence"
        Write-Host "   - Teams está listo para llamadas"
    }
    
    Start-Sleep -Seconds 2
    Clear-Host
}