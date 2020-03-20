#region 
Clear-Host
$num = Read-Host -Prompt "Kindly Enter the Mailbox size you want to check _ "
$num = [int32]$num
$symbol = Read-Host -Prompt "To Check for mailbox less than the values entered KeyIn '<' Or To Check for mailbox greater than the values entered KeyIn '>' "
$gbcheck = Read-Host -Prompt "Kindly Enter the 'MB' for megabyte - 'GB' for gigabytes - 'KB' for kilobytes "

if ($symbol -eq "<"){
    $values = Get-Mailbox -ResultSize Unlimited | Get-MailboxStatistics  
    $arr = @{}
    foreach($value in $values){
        $dvalue = $value.TotalItemSize.Value
        $dvalue = $dvalue.ToString()
        $tvalue = $dvalue -replace '\s',''
        $tvalue = $tvalue -replace '\,',''
        $tvalue = $tvalue -replace '\(',''
        $tvalue = $tvalue -replace '\)',''
        $tvalue = $tvalue -replace '\.',''
        $svalue = $tvalue.IndexOf("B")
        $lvalue = $tvalue.IndexOf("b")
        $svalue = $svalue + 1
        $lvalue = $lvalue - $svalue
        $size = $tvalue.Substring($svalue, $lvalue)
        $check = $tvalue.Substring($svalue-2, 2)
        $size = [int32]$size
        if($check -eq "KB" -and $gbcheck -eq "KB"){
            $size = $size/1024
            if($size -lt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }elseif($check -eq "MB" -and $gbcheck -eq "MB"){
            $size = $size/1024/1024
            if($size -lt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }elseif($check -eq "GB" -and $gbcheck -eq "GB"){
            $size = $size/1024/1024/1024
            if($size -lt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }
    }
}elseif ($symbol -eq ">") {
    $values = Get-Mailbox -ResultSize Unlimited | Get-MailboxStatistics  
    $arr = @{}
    foreach($value in $values){
        $dvalue = $value.TotalItemSize.Value
        $dvalue = $dvalue.ToString()
        $tvalue = $dvalue -replace '\s',''
        $tvalue = $tvalue -replace '\,',''
        $tvalue = $tvalue -replace '\(',''
        $tvalue = $tvalue -replace '\)',''
        $tvalue = $tvalue -replace '\.',''
        $svalue = $tvalue.IndexOf("B")
        $lvalue = $tvalue.IndexOf("b")
        $svalue = $svalue + 1
        $lvalue = $lvalue - $svalue
        $size = $tvalue.Substring($svalue, $lvalue)
        $check = $tvalue.Substring($svalue-2, 2)
        $size = [int32]$size
        if($check -eq "KB" -and $gbcheck -eq "KB"){
            $size = $size/1024
            if($size -gt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }elseif($check -eq "MB" -and $gbcheck -eq "MB"){
            $size = $size/1024/1024
            if($size -gt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }elseif($check -eq "GB" -and $gbcheck -eq "GB"){
            $size = $size/1024/1024/1024
            if($size -gt $num){
                $arr.Add($value.DisplayName, $value.TotalItemSize)
            }
        }
    }    
}
[pscustomobject]$arr | Export-Csv .\MboxSize.csv -NoTypeInformation
Write-Output $arr
#endregion