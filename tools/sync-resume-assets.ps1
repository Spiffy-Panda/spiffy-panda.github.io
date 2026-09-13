<#
.SYNOPSIS
    Copy hero card art out of each project's resume-assets/ folder into the site.

.DESCRIPTION
    The five projects that carry a resume-assets/ folder each own their own art. This
    script pulls one thumbnail and one emblem per project into
    content/assets/projects/<slug>/ so the site never becomes the source of truth for
    a graphic it does not generate. Re-run it whenever a project re-renders its art.

    Write-up pages come across too. They are self-contained single files, so they
    are served straight out of the asset folder and the hero cards link to them.

    Every text file is run past an identity gate first. A blocked term stops the
    whole run; a flagged term copies but prints a warning naming the file, which is
    the Rule 6 check Builder-Research's own README asks for.

.PARAMETER GodotRoot
    Folder holding the Godot-side project repos.

.PARAMETER UwRoot
    Folder holding the coursework-side project repos.

.PARAMETER WhatIf
    Report what would be copied without writing anything.

.EXAMPLE
    powershell -File tools\sync-resume-assets.ps1
    powershell -File tools\sync-resume-assets.ps1 -WhatIf
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$GodotRoot = 'C:\Users\Brian\Documents\GodotProj',
    [string]$UwRoot    = 'C:\Users\Brian\Documents\UW Winter 26'
)

$ErrorActionPreference = 'Stop'
$siteRoot = Split-Path -Parent $PSScriptRoot
$destRoot = Join-Path $siteRoot 'content\assets\projects'

# Identity gate. Blocked terms stop the whole run rather than skipping one file, so
# a leak is loud instead of quiet. Flagged terms copy with a warning, because whether
# they belong on a public page is a judgement call, not this script's to make.
#
# Both names are flagged rather than blocked. This is a job-hunting portfolio, so the
# legal name is deliberately on it and has to match what recruiters see elsewhere; a
# blocking gate here would fight the site's own masthead. The warning still fires, so
# a name arriving in a write-up from another repo is never silent.
$blockedTerms = @()
$flaggedTerms = @('Brian', 'Notarianni')

# One row per project. 'Thumbnail' is the 1280x720 card; 'Emblem' is the square mark.
# Where a project staged several candidates, the pick is named here and the rest stay
# in that project's own staging folder.
$projects = @(
    @{
        Slug      = 'ai-bt-gym'
        Title     = 'The Fighter That Ran Away'
        Source    = Join-Path $GodotRoot 'AI-BT-Gym\resume-assets'
        Thumbnail = 'thumbnail-a.png'   # a/b/c staged; a stays legible at card width
        Emblem    = 'emblem.svg'
        WriteUps  = @('write-up.html')
    },
    @{
        Slug      = 'ostranaut-explorer'
        Title     = 'Ostranaut Data Explorer'
        Source    = Join-Path $GodotRoot 'OstranautDataExplorer\resume-assets'
        Thumbnail = 'thumbnail\thumb-b-dark-product.svg'
        Emblem    = 'emblem\emblem-b-arraychain.svg'
        WriteUps  = @('write-up.html')
    },
    @{
        Slug      = 'sounding-chamber'
        Title     = 'Sounding Chamber'
        Source    = Join-Path $GodotRoot 'SoundingChamber\resume-assets'
        Thumbnail = 'thumbnail.png'     # 13 variants sit beside it; this is the pick
        Emblem    = 'emblem-A-confluence.svg'
        WriteUps  = @('write-up.html')
    },
    @{
        Slug      = 'panda-papers-podcast'
        Title     = 'Panda Papers Podcast'
        Source    = Join-Path $UwRoot 'ProductivityAndReadingHelper\resume-assets'
        Thumbnail = 'thumbnail.svg'
        Emblem    = 'icon.svg'          # no emblem was ever promoted; the icon fills the slot
        WriteUps  = @('write-up.html')
    },
    @{
        Slug      = 'builder-research'
        Title     = 'Who Are The Builders?'
        Source    = Join-Path $UwRoot 'Builder-Research\resume-assets'
        Thumbnail = 'thumbnail-dark.svg'
        Emblem    = 'emblem.svg'
        # Two pages. The card links to the first; the second is linked from inside it.
        WriteUps  = @('write-up.html', 'write-up-synth-users.html')
    }
)

function Test-Identity {
    param([string]$Path)

    # Binary art cannot carry a readable name, so only text formats are scanned.
    if ([IO.Path]::GetExtension($Path) -notin @('.svg', '.html', '.md', '.txt')) { return @() }

    $text = Get-Content -Path $Path -Raw -Encoding UTF8

    foreach ($term in $blockedTerms) {
        if ($text -match [regex]::Escape($term)) {
            throw "Identity gate: '$term' found in $Path. Fix the source before syncing."
        }
    }

    $hits = @()
    foreach ($term in $flaggedTerms) {
        if ($text -match [regex]::Escape($term)) {
            # Name the project, not the folder: every source sits in a 'resume-assets'.
            $project = Split-Path -Leaf (Split-Path -Parent (Split-Path -Parent $Path))
            $hits += "$term in $project/$(Split-Path -Leaf $Path)"
        }
    }
    return $hits
}

function Copy-Asset {
    param([string]$Source, [string]$Destination)

    $flags = Test-Identity -Path $Source

    if ($PSCmdlet.ShouldProcess($Destination, 'Copy')) {
        $dir = Split-Path -Parent $Destination
        if (-not (Test-Path -LiteralPath $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
        Copy-Item -LiteralPath $Source -Destination $Destination -Force
    }
    return $flags
}

$copied = 0
$missing = @()
$flagged = @()

foreach ($p in $projects) {
    $destDir = Join-Path $destRoot $p.Slug

    foreach ($kind in @('Thumbnail', 'Emblem')) {
        $src = Join-Path $p.Source $p[$kind]

        if (-not (Test-Path -LiteralPath $src)) {
            $missing += "$($p.Slug): $kind not found at $src"
            continue
        }

        $ext  = [IO.Path]::GetExtension($src)
        $dest = Join-Path $destDir ($kind.ToLower() + $ext)

        $flagged += Copy-Asset -Source $src -Destination $dest

        Write-Output "  $($p.Slug)/$($kind.ToLower())$ext  <-  $($p[$kind])"
        $copied++
    }

    # Write-up pages keep their own filenames, so a project can carry more than one
    # and the extras stay linkable from inside the first. Quartz strips .html off
    # every internal href it rewrites, so the hero links land on the extensionless
    # form; both the dev server and Pages resolve that back to the .html file.
    foreach ($page in $p.WriteUps) {
        $src = Join-Path $p.Source $page

        if (-not (Test-Path -LiteralPath $src)) {
            $missing += "$($p.Slug): write-up not found at $src"
            continue
        }

        $dest = Join-Path $destDir $page
        $flagged += Copy-Asset -Source $src -Destination $dest

        Write-Output "  $($p.Slug)/$page  <-  $page"
        $copied++
    }
}

Write-Output ''
Write-Output "$copied file(s) from $($projects.Count) project(s) -> content\assets\projects\"

if ($flagged.Count -gt 0) {
    Write-Output ''
    Write-Warning 'Identity gate - flagged terms went through, review before publishing:'
    $flagged | Sort-Object -Unique | ForEach-Object { Write-Warning "  $_" }
}

if ($missing.Count -gt 0) {
    Write-Output ''
    Write-Warning 'Some sources were missing:'
    $missing | ForEach-Object { Write-Warning "  $_" }
}
