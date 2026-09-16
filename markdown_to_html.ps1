  Get-ChildItem -File -Filter *.md | ForEach-Object {
      $output = Join-Path .\html ($_.BaseName + ".html")
      pandoc --from markdown+lists_without_preceding_blankline --standalone --lua-filter=external-links.lua --syntax-highlighting monokai.theme --template=fragment-template.html  --to html --output $output $_.FullName
  }