#TO RUN at Documentation/

cls

$debugMode = $false

function GoPandoc($markdownPath, $htmlPath, $headerPath, $footerPath){
$header = (gc $headerPath)
$footer = (gc $footerPath)

 write-host "Generating $htmlPath ..."
 $content = pandoc $markdownPath
 $header + $content + $footer | sc $htmlPath

  
   
}

if($debugMode -eq $false)
{

## CHECK IF PANDOC IS INSTALLED
$pandoCAliasExists = test-path alias:pandoc
if($pandoCAliasExists -eq $false){ 
    write-host "Creates an alias for pandoc.exe ..."
    new-alias pandoc "C:\Users\ssaidou-babio\AppData\Local\Pandoc\pandoc.exe"
 }


 ni -ItemType Directory "html" -force | Out-Null


gci -Path "markdown" -Filter "*.md"  | %{
    $name = $_.Name
    $basename = $_.BaseName
    GoPandoc $_.FullName "html/$basename.html" "markdown/header.html" "markdown/footer.html"
}

}
else
{
    write-host "you are in debug mode !!!"
}

#write-host pandoc -o output.html '.\Getting Started.md'