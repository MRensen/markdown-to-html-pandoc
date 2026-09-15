  Get-ChildItem -File -Filter *.md | ForEach-Object {
      $output = Join-Path .\html ($_.BaseName + ".html")
      pandoc --from markdown+lists_without_preceding_blankline --standalone --syntax-highlighting monokai.theme --template=fragment-template.html  --to html --output $output $_.FullName
  }