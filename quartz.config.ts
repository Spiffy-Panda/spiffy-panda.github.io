import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "Brian's Portfolio",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: null,
    locale: "en-US",
    baseUrl: "spiffy-panda.github.io",
    ignorePatterns: ["private", "templates", ".obsidian", "In-Progress-Workspace"],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Schibsted Grotesk",
        body: "Source Sans Pro",
        code: "IBM Plex Mono",
      },
      // yss-theme-bamboo, Panda's house palette: celadon paper by day, green paper
      // by night. Values are lifted from bamboo.css unchanged wherever Quartz has a
      // token for them, so the two stay comparable:
      //   light = bg, lightgray = line, gray = muted, darkgray = fg-2, dark = fg,
      //   secondary = accent.
      // Quartz has no hover token, so `tertiary` is the one derived value here: the
      // accent lightened enough to read as a state change. Every text pair clears AA.
      colors: {
        lightMode: {
          light: "#eaf0ea",
          lightgray: "#c8d6c9",
          gray: "#77857c",
          darkgray: "#47554e",
          dark: "#16201c",
          secondary: "#1f6b52",
          tertiary: "#2e8f6d",
          highlight: "rgba(31, 107, 82, 0.12)",
          textHighlight: "#d6a64866",
        },
        darkMode: {
          light: "#151915",
          lightgray: "#313a31",
          gray: "#7b8175",
          darkgray: "#b0b6aa",
          dark: "#e8ebe2",
          secondary: "#9ad07a",
          tertiary: "#b8e29d",
          highlight: "rgba(154, 208, 122, 0.15)",
          textHighlight: "#d6a64855",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.Favicon(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
