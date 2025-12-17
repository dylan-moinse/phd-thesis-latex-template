%% =====================================
%% Thesis Class
%% Consolidated version - 2025
%% =====================================
%% Separate external files to keep:
%% - bib.sty (bibliography)
%% - color.sty (colors)
%% - fig.sty (figures, maps, tables, and equations)
%% - font.sty (fonts)
%% - header.sty (headers and footers)
%% - section.sty (part, chapter, and section formatting)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/01/01 Thesis Class]

%% =====================================
%% BASE CLASS
%% =====================================
%% Description: Load the base book class with standard options for thesis
%% - a4paper: European A4 paper size (210×297mm)
%% - 12pt: Base font size of 12 points
%% - twoside: Different margins for left and right pages (for printing)
%% - openright: Chapters start on right (odd) pages only
\LoadClass[a4paper,12pt,twoside,openright]{book}

%% =====================================
%% ENGINE CONFIGURATION
%% =====================================
%% Description: Configure LaTeX for both LuaLaTeX and PDFLaTeX engines

%% etoolbox: Provides advanced programming tools for LaTeX
%% Used for: conditional statements, patching commands, toggles
\RequirePackage{etoolbox}

%% ifluatex: Detects if document is compiled with LuaLaTeX
%% Returns true if using LuaLaTeX, false otherwise
\RequirePackage{ifluatex}

%% subfiles: Allows chapter files to be compiled independently
\RequirePackage{subfiles}

%% =====================================
%% LANGUAGE CONFIGURATION - BABEL
%% =====================================
%% Description: Configure document language and localization

\ifluatex
  %% If using LuaLaTeX: Modern Unicode engine
  %% babel[english]: Provides English typography rules
  %% change in french for automatic spacing before punctuation (: ; ! ?), quotation marks (« »), date format and hyphenation patterns
  \RequirePackage[english]{babel}
\else
  %% If using PDFLaTeX: Traditional engine
  %% inputenc[utf8]: Allows UTF-8 encoded input files
  %% This enables direct use of accented characters (é, è, à, etc.)
  \RequirePackage[utf8]{inputenc}
  %% babel[english]: Same as above, for PDFLaTeX
  \RequirePackage[english]{babel}
\fi

%% =====================================
%% English TYPOGRAPHY CUSTOMIZATION
%% =====================================
%% Description: Customize English localization strings

%% addto\captionsenglish: Modify default English captions
%% \listfigurename: Title of the list of figures
%% Default would be "List of Figures", changed to "List of Illustrations"
\addto\captionsenglish{\renewcommand{\listfigurename}{List of Illustrations}}

%% frenchsetup: Configure French babel options
%% SmallCapsFigTabCaptions=false: Do not use small caps for figure/table captions
%% (keeps regular capitalization)
% \frenchsetup{SmallCapsFigTabCaptions=false}

%% Additional French setup: Configure quotation marks
%% og = opening guillemet (opening quote) = «
%% fg = closing guillemet (closing quote) = »
%% This ensures proper French quotation style
% \frenchsetup{og=«, fg=»}

%% =====================================
%% PAGE GEOMETRY
%% =====================================
%% Description: Configure page margins and layout

%% geometry: Package for flexible page layout
%% Options set:
%% left=3cm: Left margin (inside margin when printing two-sided)
%% right=3cm: Right margin (outside margin when printing two-sided)
%% top=2cm: Top margin (space above text area)
%% bottom=2cm: Bottom margin (space below text area, includes footer)
%% These margins provide comfortable reading space and room for binding
\RequirePackage[left=3cm, right=3cm, top=2cm, bottom=2cm]{geometry}

%% =====================================
%% BIBLIOGRAPHY (external file)
%% =====================================
%% Description: Load bibliography configuration from separate file
%% This file configures biblatex with authoryear style
%% Kept separate for easy bibliography style changes
\RequirePackage{asset/style/bib}

%% =====================================
%% COLORS (external file)
%% =====================================
%% Description: Load color scheme from separate file
%% Kept separate for easy customization of color scheme
\RequirePackage{asset/style/color}

%% =====================================
%% FONTS (external file)
%% =====================================
%% Description: Load font configuration from separate file
%% This file configures main fonts (Verdana)
%% Kept separate for easy font changes
\RequirePackage{asset/style/font}

%% =====================================
%% HEADERS & FOOTERS (external files)
%% =====================================
%% Description: Load header and footer configuration from separate files
%% These files are kept separate for easy customization
%% - header.sty: Page headers (top of page)
%% - footer.sty: Page footers (bottom of page)

\RequirePackage{asset/style/header}

%% =====================================
%% FIG (external file)
%% =====================================
%% Description: Load fig scheme from separate file
%% Kept separate for easy customization of fig scheme
\RequirePackage{asset/style/fig}

%% =====================================
%% MATHEMATICS PACKAGES
%% =====================================
%% Description: Load packages for mathematical typesetting

\RequirePackage{amsmath}

%% mathtools: Enhanced math features, extends amsmath
%% Provides:
%% - Better equation alignment
%% - \mathclap, \mathllap, \mathrlap for spacing
%% - Enhanced matrix commands
%% - Better \substack command
\RequirePackage{mathtools}

%% amssymb: AMS (American Mathematical Society) symbol fonts
%% Provides:
%% - Extended mathematical symbols
%% - Blackboard bold fonts
%% - Additional Greek letters
\RequirePackage{amssymb}

%% siunitx: Typesetting of numbers and units according to SI standards
%% Provides:
%% - \SI{10}{\meter\per\second} = 10 m/s
%% - \num{123456789} = 123 456 789 (with proper spacing)
%% - Automatic alignment in tables
%% - Handles uncertainties: \SI{10 +- 0.5}{\meter}
\RequirePackage{siunitx}

%% xfrac: Provides slanted fractions
%% \sfrac{1}{2} produces a diagonal fraction ¹⁄₂
%% Better for inline fractions than \frac (which is too tall)
\RequirePackage{xfrac}

%% =====================================
%% EQUATION SPACING CONFIGURATION
%% =====================================
%% Description: Set vertical spacing around equations

%% Create a custom length register for equation spacing
\newlength{\myeqskip} 
%% Set the spacing to 3ex (3 times the height of 'x' in current font)
\setlength{\myeqskip}{3ex}

%% AtBeginDocument: Execute commands when document begins
%% This ensures spacing is applied after all fonts are loaded
\AtBeginDocument{%
    %% abovedisplayskip: Space above displayed equations
    \setlength\abovedisplayskip{\myeqskip}%
    %% belowdisplayskip: Space below displayed equations
    \setlength\belowdisplayskip{\myeqskip}%
    %% abovedisplayshortskip: Space above equations when preceding text is short
    \setlength\abovedisplayshortskip{\myeqskip-\baselineskip}%
    %% belowdisplayshortskip: Space below equations (short version)
    \setlength\belowdisplayshortskip{\myeqskip}
}

%% =====================================
%% GRAPHICS & FIGURES
%% =====================================
%% Description: Load packages for including and managing graphics

%% graphicx: Standard package for including images
%% Provides:
%% - \includegraphics[options]{filename}
%% - Options: width, height, scale, angle, clip, trim
%% - Supports: PDF, PNG, JPG, EPS formats
\RequirePackage{graphicx}

%% subcaption: Create subfigures and subtables
%% Provides:
%% - \subcaption{} for sub-captions
%% - subfigure environment for side-by-side figures
%% - Automatic (a), (b), (c) labeling
%% Example: Figure 1.1(a), Figure 1.1(b)
\RequirePackage{subcaption}

%% wrapfig: Wrap text around figures
%% Provides:
%% - wrapfigure environment
%% - Text flows around the figure
%% - Useful for small figures in paragraphs
\RequirePackage{wrapfig}

%% floatrow: Enhanced control of float layout
%% Provides:
%% - Better control of caption position
%% - Side-by-side floats
%% - Margin floats
%% - Custom float styles
\RequirePackage{floatrow}

%% =====================================
%% TIKZ - GRAPHICS PROGRAMMING
%% =====================================
%% Description: Load TikZ for creating diagrams programmatically

%% tikz: Main package for creating graphics with code
%% Allows creation of:
%% - Diagrams, graphs, flowcharts
%% - Geometric figures
%% - Plots and data visualization
%% - Annotations and overlays
\RequirePackage{tikz}

%% Load TikZ libraries for extended functionality:
\usetikzlibrary{
    positioning,
    shapes.geometric,
    arrows.meta,
    calc
}

%% positioning: Relative positioning of nodes
%% Keywords: above, below, left, right of
%% Example: \node[below=of A] {B}; places B below A
\usetikzlibrary{positioning}

%% backgrounds: Draw elements behind others
%% Provides: background layer for multi-layer drawings
\usetikzlibrary{backgrounds}

%% shapes: Additional node shapes
%% Provides: rectangle, circle, ellipse, diamond, trapezium, etc.
%% Example: \node[draw, circle] {text};
\usetikzlibrary{shapes}

%% =====================================
%% TABLES
%% =====================================
%% Description: Load packages for creating and formatting tables

%% multirow: Create cells spanning multiple rows
%% Provides: \multirow{nrows}{width}{content}
%% Example: \multirow{2}{*}{text} spans 2 rows
\RequirePackage{multirow}

%% adjustbox: Resize and adjust boxes (including tables)
%% Provides:
%% - \adjustbox{width=\textwidth}{content}
%% - Scale tables to fit page width
%% - Rotate, trim, clip content
\RequirePackage{adjustbox}

%% longtable: Tables that span multiple pages
%% Features:
%% - Automatic page breaks within table
%% - Repeated headers on each page
%% - Repeated footers
%% Essential for large data tables
\RequirePackage{longtable}

%% colortbl: Add color to table cells, rows, columns
%% Provides:
%% - \rowcolor{color} for colored rows
%% - \columncolor{color} for colored columns
%% - \cellcolor{color} for individual cells
\RequirePackage{colortbl}

%% booktabs: Professional quality tables
%% Provides:
%% - \toprule, \midrule, \bottomrule (better than \hline)
%% - \cmidrule for partial horizontal lines
%% - Better vertical spacing
%% Produces publication-quality tables
\RequirePackage{booktabs}

%% tabularx: Tables with auto-width columns
%% Provides:
%% - X column type that auto-expands to fill width
%% - \begin{tabularx}{\textwidth}{X X} for two equal columns
%% Useful when table width must match text width
\RequirePackage{tabularx}

%% tabularray: Modern table interface (new package)
%% Provides:
%% - Simpler syntax than traditional tables
%% - Better cell styling
%% - Easier multi-row/multi-column cells
\RequirePackage{tabularray}

%% arydshln: Dashed lines in tables
%% Provides:
%% - \hdashline for horizontal dashed lines
%% - \cdashline for partial dashed lines
%% - : column separator for vertical dashed lines
%% Example: \begin{tabular}{c:c} creates vertical dashed line
\RequirePackage{arydshln}

%% =====================================
%% FLOATS & CAPTIONS
%% =====================================
%% Description: Configure figure and table captions

%% caption: Customize caption appearance
%% Controls:
%% - Caption format (bold, italic, etc.)
%% - Caption separator (colon, period, etc.)
%% - Caption position (above, below)
%% - Caption width and alignment
\RequirePackage{caption}

%% chngcntr: Change counter behavior
%% Used here to make figure numbers depend on chapter
\RequirePackage{chngcntr}

%% Make figure numbers include chapter: Figure 3.1, 3.2, etc.
%% Instead of continuous: Figure 1, 2, 3...
%% Resets figure counter at each chapter
\counterwithin{figure}{chapter}

%% Rename "Figure" to "Illustration" in French
%% \captionsetup[figure]: Settings specific to figures
%% name=Illustration: Changes "Figure 1.1" to "Illustration 1.1"
\captionsetup[figure]{name=Figure}

%% Rename "Table" to "Tableau" in French
%% \captionsetup[table]: Settings specific to tables
\captionsetup[table]{name=Table}

%% =====================================
%% CUSTOM FLOAT: CARTE (MAP)
%% =====================================
%% Description: Create a new float type for maps/cartes

%% float: Create new float types
%% Provides: \newfloat command for defining custom floats
\RequirePackage{float}

%% newfloat: Enhanced float definition
%% More flexible than basic \newfloat from float package
\RequirePackage{newfloat}

%% Define basic float style
%% floatstyle{plain}: Use plain style (no frame, no special format)
\floatstyle{plain}

%% Create new float type "map"/"carte"
%% Syntax: \newfloat{type}{placement}{extension}[parent_counter]
%% - carte: Name of the float type
%% - htbp: Default placement (here, top, bottom, page)
%% - loc: File extension for list of maps (.loc file)
%% - [chapter]: Counter depends on chapter (like figures)
\newfloat{map}{htbp}{lom}

%% Set display name for this float type
%% This appears in captions: "Map 3.1: Map title"
\floatname{map}{Map}

%% Map caption
\captionsetup[map]{
    format=plain,
    labelsep=colon,
    font=normalfont,
    labelfont=normalfont,
    textfont=normalfont,
    justification=centering,
    position=below
}

%% Alternative declaration using DeclareFloatingEnvironment
%% This is more modern syntax from newfloat package
%% Provides same functionality with different syntax
\DeclareFloatingEnvironment[
    fileext=loc, % File extension for list of maps
    name=Map, % Display name in captions
    within=chapter % Counter resets per chapter
]{map}

%% Make map counter dependent on chapter
%% Ensures numbering like: Carte 1.1, 1.2, 2.1, 2.2...
\counterwithin{map}{chapter}

%% =====================================
%% EQUATION FLOAT ENVIRONMENT
%% =====================================
%% Description: Create floating environment for equations with captions

%% Save original equation environment (to avoid conflict)
\let\mathequation\equation
\let\endmathequation\endequation

%% Create new float type for equations
\newfloat{equationfloat}{htbp}{loe}
\floatname{equationfloat}{Equation}

%% =====================================
%% LIST OF EQUATIONS
%% =====================================

\newcommand{\listofequations}{
  \listof{equationfloat}{List of Equations}
}

%% Configure caption format (same as figures and maps)
\captionsetup[equationfloat]{
    format=plain,
    labelsep=colon,
    font=normalfont,
    labelfont=normalfont,
    textfont=normalfont,
    justification=centering,
    position=below
}

%% Number by chapter (Equation 3.2)
\numberwithin{equationfloat}{chapter}

%% =====================================
%% TYPOGRAPHY & SPACING
%% =====================================
%% Description: Configure text spacing and paragraph formatting

%% parskip: Paragraph spacing and indentation
%% Options:
%% - skip=8pt plus1pt: 8pt space between paragraphs (can stretch by 1pt)
%% - indent=20pt: First line indentation of 20pt
%% Controls vertical space between paragraphs
\usepackage[skip=8pt plus1pt, indent=20pt]{parskip}

%% raggedbottom: Allow variable page height
%% Alternative to \flushbottom which stretches content to fill page
%% Result: Bottom margins may vary slightly between pages
%% Advantage: More even spacing, fewer large gaps in text
\raggedbottom

%% =====================================
%% LINE SPACING
%% =====================================
%% Description: Configure spacing between lines

%% setspace: Control line spacing throughout document
%% Provides:
%% - \setstretch{factor} for custom spacing
%% - \doublespacing for double spacing
%% - \onehalfspacing for 1.5 spacing
%% - \singlespacing to return to single spacing
\RequirePackage{setspace}

%% Set line spacing to 1.3 times the base spacing
%% 1.0 = single spacing (tight)
%% 1.5 = standard "one and a half" spacing
%% 2.0 = double spacing (very loose)
%% 1.3 = comfortable reading spacing (French academic standard)
\setstretch{1.3}

%% =====================================
%% BASE FONT SIZE
%% =====================================
%% Description: Set document base font size

%% Redefine \normalsize command
%% \fontsize{size}{baselineskip}
%% - 10pt: Character height
%% - 12pt: Line height (space from baseline to baseline)
%% Ratio 12/10 = 1.2 provides comfortable reading
\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}

%% =====================================
%% WIDOWS AND ORPHANS PREVENTION
%% =====================================
%% Description: Prevent single lines at page breaks

%% Widow: Last line of paragraph alone at top of page (bad)
%% Orphan: First line of paragraph alone at bottom of page (bad)

%% nowidow: Automatically prevent widows and orphans
%% Option [all]: Apply to all paragraph types
%% This package uses penalties to discourage bad breaks
%% Better than manual \widowpenalty and \clubpenalty settings
\RequirePackage[all]{nowidow}

%% =====================================
%% HYPHENATION CONTROL
%% =====================================
%% Description: Configure word breaking at line ends

%% tolerance: How much white space variation is acceptable
%% 0 = very strict (may cause overfull boxes)
%% 10000 = very tolerant (may cause loose spacing)
%% 1 = accept almost no variation (prevents bad spacing)
\tolerance=1

%% emergencystretch: Extra stretchability for difficult lines
%% \maxdimen = maximum dimension in TeX (very large)
%% Allows TeX to stretch spaces greatly if needed
%% Prevents overfull boxes at cost of loose spacing
\emergencystretch=\maxdimen

%% hyphenpenalty: Penalty for hyphenating words
%% 10000 = infinite penalty (essentially disables hyphenation)
%% Words won't break at line ends
%% May cause irregular right margin
\hyphenpenalty=10000

%% hbadness: Threshold for reporting underfull/overfull hboxes
%% 10000 = don't report badness warnings
%% Suppresses warnings about spacing issues
\hbadness=10000

%% =====================================
%% FRENCH TYPOGRAPHY RULES
%% =====================================
%% Description: Apply French printing standards

%% impnattypo: French National Printing Office typography rules
%% Implements traditional French typography standards
%% Options:
% \RequirePackage[%
% draft, % Draft mode: shows typography issues
% hyphenation, % Apply French hyphenation rules
% parindent % Indent first line of paragraphs (French style)
% ]{impnattypo}
%% Other available options (commented):
%% - lastparline: Ensure last line of paragraph is not too short
%% - nosingleletter: Prevent single letters at line end
%% - rivers: Highlight "rivers" of white space (debugging)
%% - frenchchapters: Chapter numbers in Roman numerals

%% =====================================
%% QUOTATION MARKS
%% =====================================
%% Description: Intelligent quotation mark handling

%% csquotes: Context-sensitive quotation marks
%% Features:
%% - Automatic quotation style based on language
%% - \enquote{text} for proper quotes
%% - Nested quotation marks handled automatically
%% - French: Uses « guillemets »
%% - English: Uses "quotes"
%% Essential for multilingual documents
\RequirePackage{csquotes}

%% =====================================
%% TYPOGRAPHIC EFFECTS
%% =====================================
%% Description: Text underlining, striking, etc.

%% ulem: Underlining and striking out text
%% [normalem]: Don't redefine \emph (keep it as italic)
%% Provides:
%% - \uline{text} for underlining
%% - \sout{text} for striking out
%% - \xout{text} for hatching out
%% - \dashuline{text} for dashed underline
\RequirePackage[normalem]{ulem}

%% Custom command: strikethrough in orange
%% \rature = "crossing out" in French
%% Usage: \rature{old text}
%% Result: old text with orange strikethrough
\newcommand{\rature}[1]{%
  {\color{orange}\sout{#1}{}}
}

%% =====================================
%% VERBATIM TEXT
%% =====================================
%% Description: Display text exactly as typed

%% verbatim: Enhanced verbatim environment
%% Features:
%% - verbatim environment: Display text literally
%% - \verbatiminput{file}: Include file contents verbatim
%% - Useful for code, file contents, ASCII art
%% All special characters displayed as-is (no interpretation)
\RequirePackage{verbatim}

%% =====================================
%% SECTION NUMBERING DEPTH
%% =====================================
%% Description: Control which sections get numbers

%% secnumdepth: How deep to number sections
%% -1 = part
%%  0 = chapter
%%  1 = section
%%  2 = subsection
%%  3 = subsubsection
%%  4 = paragraph
%%  5 = subparagraph
%% Value 5: Number everything down to subparagraph
\setcounter{secnumdepth}{5}

%% tocdepth: How deep to show in table of contents
%% Value 2: Show up to subsections in TOC
%% (chapters, sections, subsections, but not subsubsections)
\setcounter{tocdepth}{2}

%% =====================================
%% SECTION COUNTER INDEPENDENCE
%% =====================================
%% Description: Make section numbers independent of chapter

%% counterwithout: Remove counter dependency
%% By default: sections are numbered 1.1, 1.2, 2.1, 2.2
%% After this: sections are numbered 1, 2, 3, 4...
%% Continuous numbering across chapters
\counterwithout{section}{chapter}

%% =====================================
%% SECTION COLORS
%% =====================================
%% Description: Apply defined colors to section titles

%% silence: Suppress specific warnings
%% [immediate]: Apply filters immediately
%% Needed because sectsty triggers warnings we want to ignore
\RequirePackage[immediate]{silence}
\WarningFilter[temp]{latex}{Command \underbar has changed.}
\WarningFilter[temp]{latex}{Command \underline has changed.}

%% Filter out warnings about \underbar and \underline
%% These warnings are harmless but annoying
%\WarningFilter[temp]{latex}{Command \underbar  has changed.}
%\WarningFilter[temp]{latex}{Command \underline  has changed.}

%% Filter biblatex indexing warnings
%\WarningFilter{latex}{Missing number, treated as zero}

%% sectsty: Section title styling
%% Allows changing font, color, size of section titles
\RequirePackage{sectsty}

%% Deactivate warning filters after loading sectsty
%% Ensures other warnings are still shown
\DeactivateWarningFilters[temp]

%% Apply blue color to all division levels
%% \partfont: Style for part titles
\partfont{\color{customizedcolor}}
%% \chapterfont: Style for chapter titles
\chapterfont{\color{customizedcolor}}
%% \sectionfont: Style for section titles
\sectionfont{\color{customizedcolor}}
%% \subsectionfont: Style for subsection titles
\subsectionfont{\color{customizedcolor}}
%% \subsubsectionfont: Style for subsubsection titles
\subsubsectionfont{\color{customizedcolor}}

%% =====================================
%% SECTION FORMATTING (external file)
%% =====================================
%% Description: Load section formatting from separate file
%% Kept separate for easy customization
\RequirePackage{asset/style/section}

%% =====================================
%% CHAPTER NUMBER IN WORDS
%% =====================================
%% Description: Display chapter numbers as words (One, Two, etc.)

%% fmtcount: Format counters in various ways
%% Provides:
%% - \numberstring{counter}: "one", "two", "three"
%% - \Numberstring{counter}: "One", "Two", "Three"
%% - \ordinalstring{counter}: "first", "second", "third"
%% - Supports multiple languages
\RequirePackage{fmtcount}

%% Patch chapter commands to use word numbers
% \makeatletter
%% \patchcmd{command}{search}{replace}{success}{failure}
%% Replace \thechapter (number) with \numberstring{chapter} (word)
%% in chapter heading
% \patchcmd{\@makechapterhead}{\thechapter}{\numberstring{chapter}}{}{}
%% Same replacement in chapter mark (for headers)
% \patchcmd{\chaptermark}{\thechapter}{\numberstring{chapter}}{}{}
% \makeatother
%% Result: "Chapter one" instead of "Chapter 1"

%% =====================================
%% TABLE OF CONTENTS
%% =====================================
%% Description: Configure table of contents generation

%% etoc: Enhanced table of contents
%% Features:
%% - Local table of contents (per chapter)
%% - Multiple TOCs in same document
%% - Custom TOC formatting
%% - TOC depth control per call
%% Example: \localtableofcontents for chapter TOC
\RequirePackage{etoc}

%% nameref: Reference section names, not just numbers
%% Extends \ref to include section titles
%% \nameref{label}: Returns title instead of number
%% Example: \nameref{sec:intro} might give "Introduction"
%% instead of "1.2"
\RequirePackage{nameref}

%% =====================================
%% PDF HANDLING
%% =====================================
%% Description: Include external PDF files

%% pdfpages: Include PDF documents
%% Provides:
%% - \includepdf[options]{file.pdf}
%% - Options: pages, nup, scale, angle, etc.
%% - Can include single pages or entire documents
%% Useful for: including published articles, forms, etc.
\RequirePackage{pdfpages}

%% =====================================
%% HYPERREF - MUST BE NEAR END
%% =====================================
%% Description: Create hyperlinks in PDF

%% hyperref: Add hyperlinks to PDF
%% IMPORTANT: Must be loaded near end (before only a few packages)
%% Creates clickable:
%% - Table of contents entries
%% - Cross-references (\ref, \cite)
%% - URLs (\url, \href)
%% - Bookmarks in PDF viewer
\RequirePackage{hyperref}

\RequirePackage{bookmark}
\bookmarksetup{numbered,open}

%% Configure hyperref behavior
\hypersetup{%
  colorlinks=true, % Use colored text (not boxes)
  linkcolor=customizedcolor, % Internal links in blue
  filecolor=customizedcolor, % File links in blue
  citecolor=customizedcolor, % Citation links in blue
  urlcolor=customizedcolor, % URL links in blue
}
%% Result: All links in blue color

%% =====================================
%% INDEX
%% =====================================
%% Description: Generate alphabetical index

%% makeidx: Basic index generation
%% Provides:
%% - \index{term}: Mark term for index
%% - \printindex: Print the index
%% Traditional index package
\RequirePackage{makeidx}

%% Configure index style with .mst file
\begin{filecontents*}{\jobname.mst}
    headings_flag 1                         % Enable letter headings (A, B, C...)
    heading_prefix "{\\textbf{\\Large "    % Format: large bold
    heading_suffix "}}\\nopagebreak\n"      % No page break after heading
    delim_0 ", "                            % Delimiter between name and pages
    delim_1 ", "                            % Delimiter for subentries
    delim_2 ", "                            % Delimiter for sub-subentries
    
    % Encapsulation for bold formatting
    % encap_prefix "\\textbf{"
    % encap_infix "}{"
    % encap_suffix "}"
\end{filecontents*}

%% imakeidx: Improved index generation
%% Features over makeidx:
%% - Multiple indexes in same document
%% - Automatic index compilation (no separate makeindex run needed)
%% - Better customization options
\RequirePackage{imakeidx}

% Default index (prevents imakeidx "Undefined index file <jobname>" warnings)
\makeindex

%% Create the index
%% Must call before using \index{} commands
\makeindex[name=authors, title=Author Index, options=-s \jobname.mst]

%% Customize index title
%% AtBeginDocument: Execute when document starts
%% Changes "Index" to "Author Index"/"Index des auteur·rice·s"
%% Note: Uses inclusive writing with middle dot (·)
\AtBeginDocument{\renewcommand\indexname{Author Index}}

%% idxlayout: Index layout customization
%% [font=footnotesize]: Use small font in index
%% Makes index more compact, fits more entries per page
\RequirePackage[font=footnotesize]{idxlayout}

%% Define custom index page number formats
%% \pagebf: Bold page numbers for main entries
%% \hyperpage: Makes page number a hyperlink
\newcommand{\pagebf}[1]{\textbf{\hyperpage{#1}}}

%% \pageit: Italic page numbers for secondary entries
\newcommand{\pageit}[1]{\textit{\hyperpage{#1}}}

%% =====================================
%% GLOSSARY
%% =====================================
%% Description: Generate glossary and acronym list

%% glossaries: Glossary and acronym management
%% Features:
%% - \newglossaryentry: Define glossary terms
%% - \newacronym: Define acronyms
%% - \gls{label}: Use term (prints and marks for glossary)
%% - \printglossary: Print the glossary
\RequirePackage[acronym]{glossaries}
%% Options:
%% - acronym: Create separate acronym list
%% Other useful options (not used here):
%% - toc: Add glossary to table of contents
%% - nonumberlist: Don't show page numbers
%% - nopostdot: No period after description

%% Activate glossary generation
%% Must call before defining glossary entries
\makeglossaries

%% Set width for glossary descriptions
%% 0.8\linewidth: Use 80% of line width for descriptions
%% Leaves 20% for terms
\setlength{\glsdescwidth}{0.8\linewidth}

%% Remove automatic punctuation after description
%% By default, glossaries adds a period
%% This removes it for cleaner appearance
\renewcommand*{\glspostdescription}{}

%% =====================================
%% LISTS & ENUMERATIONS
%% =====================================
%% Description: Customize list environments

%% enumitem: Enhanced lists (itemize, enumerate, description)
%% Features:
%% - Custom labels
%% - Custom spacing
%% - Nested list control
%% - Resume interrupted lists
%% Much more flexible than default lists
\RequirePackage{enumitem}

%% pifont: Pi fonts (Zapf Dingbats and Symbol)
%% Provides:
%% - \ding{number}: Dingbat symbols
%% - Decorative bullets
%% - Checkmarks, arrows, stars, etc.
%% Example: \ding{51} = checkmark ✓
\RequirePackage{pifont}

%% Define custom itemize environment
%% Creates new list type "customitemize"
%% Based on itemize, with 1 level of nesting
\newlist{customitemize}{itemize}{1}

%% Configure customitemize appearance
\setlist[customitemize,1]{
    label=\ding{228},        % Use dingbat 228 as bullet (➤)
    font=\scriptsize,        % Small font for bullets
    after=\vspace{1em}       % Add 1em space after list
}
%% Usage: \begin{customitemize} ... \end{customitemize}

%% =====================================
%% FOOTNOTES
%% =====================================
%% Description: Configure footnote appearance

%% footmisc: Footnote customization
%% Options:
\RequirePackage[%
  bottom, % Place footnotes at bottom (not mid-page)
  hang, % Hang indent for multi-line footnotes
  flushmargin % Align footnote numbers to left margin
]{footmisc}

%% Customize footnote separator rule
%% Default is a short line; this makes it full width
\renewcommand{\footnoterule}{%
    \noindent % No indentation
    \rule{\textwidth}{0.01pt} % Full-width rule, 0.01pt thick
}

%% Set footnote font size
%% \scriptsize: Very small (typically 7pt)
%% Makes footnotes less intrusive
\renewcommand{\footnotesize}{\scriptsize}

%% Set vertical space between footnotes
%% 0.5cm: Half centimeter between consecutive footnotes
\setlength{\footnotesep}{0.5cm}

%% =====================================
%% MISCELLANEOUS PACKAGES
%% =====================================
%% Description: Various utility packages

%% verse: Poetry and verse formatting
%% Provides: verse environment for poems
%% Features:
%% - Automatic indentation for continued lines
%% - \\ for line breaks
%% - Centered verses
\RequirePackage{verse}

%% eurosym: Euro currency symbol
%% Provides: \euro command for €
%% Better than just typing € (ensures consistent appearance)
\RequirePackage{eurosym}

%% needspace: Ensure minimum space on page
%% Provides: \needspace{length}
%% Usage: \needspace{4\baselineskip} before section
%% Prevents section title alone at bottom of page
\RequirePackage{needspace}

%% subfiles: Multi-file projects
%% Allows compiling sub-documents independently
%% Structure:
%% - main.tex (main document)
%% - chapter1.tex (can be compiled alone)
%% - chapter2.tex (can be compiled alone)
\RequirePackage{subfiles}

%% eso-pic: Add picture to every page
%% Provides:
%% - \AddToShipoutPicture: Add to all pages
%% - \AddToShipoutPictureBG: Add to background
%% Useful for: watermarks, backgrounds, borders
\RequirePackage{eso-pic}

%% atbegshi: Execute commands at page shipout
%% Low-level control of page output
%% Used internally by other packages (eso-pic, etc.)
\RequirePackage{atbegshi}

%% afterpage: Execute command after current page
%% Provides: \afterpage{commands}
%% Example: \afterpage{\clearpage} flushes floats after page
\RequirePackage{afterpage}

%% qrcode: Generate QR codes
%% Provides: \qrcode{text}
%% Generates QR code from text or URL
%% Useful for: adding links to printed documents
\RequirePackage{qrcode}

%% =====================================
%% SPECIAL FONTS
%% =====================================
%% Description: Define additional font families

%% Define another font family for special use
%% TeX Gyre Bonum: High-quality Bookman-like font
\newfontfamily\bonumfont{TeX Gyre Bonum}

%% Command to use Bonum font for specific words
%% Usage: \latexword{LaTeX}
%% Displays "LaTeX" in Bonum font
\newcommand{\latexword}[1]{{\bonumfont #1}}

%% =====================================
%% BOXES
%% =====================================
%% Description: Create framed boxes for content

%% boxedminipage: Minipage with frame
%% Provides: boxedminipage environment
%% Creates framed box with content inside
%% Useful for: highlighting important text, examples
\RequirePackage{boxedminipage}

%% tcolorbox: Colored and fancy boxes
%% Features:
%% - Colored backgrounds
%% - Rounded corners
%% - Shadows
%% - Breakable boxes (can span pages)
%% - Many pre-defined styles
%% Very powerful for creating attractive boxes
\RequirePackage{tcolorbox}

%% =====================================
%% DRAFT WATERMARK
%% =====================================
%% Description: Add "DRAFT" watermark to pages

%% draftwatermark: Add watermark to pages
%% Useful for: indicating draft versions, confidential documents
\RequirePackage{draftwatermark}

%% Configure watermark
%% Set text (empty = no watermark)
\SetWatermarkText{DRAFT} % "BROUILLON" in French
\SetWatermarkText{} % Disabled by default (empty text)
%% Set size
\SetWatermarkScale{1} % Scale factor (1 = 100%)
%% Set transparency
\SetWatermarkLightness{.9} % 0 = black, 1 = white (0.9 = very light)
%% Set rotation angle
\SetWatermarkAngle{50} % Degrees (50 = diagonal)
%% Set another scale value
\SetWatermarkScale{.8} % Final scale: 80% (overrides previous)

%% =====================================
%% BIBLIOGRAPHY CONFIGURATION
%% =====================================
%% Description: Configure bibliography display

%% DefineBibliographyExtras: Language-specific bibliography settings
%% For French: restore command for family names
%% This ensures proper name formatting in French bibliographies
\DefineBibliographyExtras{french}{\restorecommand\mkbibnamefamily}

%% Define custom bibliography heading for sub-bibliographies
%% Used when printing bibliography per chapter
\defbibheading{subbibliography}{
    \section*{References for Chapter~% Section title (unnumbered)
    \ref{refsegment: % Reference to chapter
     \therefsection % Section number
     \therefsegment}} % Segment number
     \tiny % Use tiny font (very small)
}

%% =====================================
%% PAGE DIFFERENCE UTILITY
%% =====================================
%% Description: Calculate page difference between labels

%% refcount: Get numeric value of references
%% Provides: \getpagerefnumber{label}
%% Returns page number as a number (not formatted)
\RequirePackage{refcount}

%% Command to calculate page difference
%% Usage: \pagedifference{label1}{label2}
%% Returns: number of pages between labels
%% Example: If label1 on page 5, label2 on page 12, returns 7
\newcommand{\pagedifference}[2]{%
  \number\numexpr\getpagerefnumber{#2}-\getpagerefnumber{#1}\relax
}

%% =====================================
%% TITLE PAGE COMMANDS
%% =====================================
%% Description: Commands for creating thesis title page

%% =====================================
%% LOGO
%% =====================================
%% Description: Place institutional logo in top right corner

%% Command to insert logo
\newcommand{\FPLogo}{%
  \begin{tikzpicture}[remember picture,overlay]
    % remember picture: Remember position for absolute placement
    % overlay: Don't affect page layout
    \node[anchor=north east, align=left, inner sep=0] at (current page.north east){
      % anchor=north east: Anchor at top-right of node
      % current page.north east: Top-right corner of page
      \includegraphics[height=2.5cm]{logoGE}
      % Logo scaled to 2.5cm height
    };
  \end{tikzpicture}
}

%% =====================================
%% CANDIDATE NAME
%% =====================================
%% Description: Format candidate name for title page

%% Command to display candidate name
%% Uses \@author (set by \author{name} in preamble)
\newcommand{\FPCandidat}{%
  {\LARGE % Large size
   \textcolor{customizedcolor}{ % Blue color
     \textbf{\MakeUppercase{\@author}} % Uppercase, bold
   }%
  }%
}

%% =====================================
%% JURY MEMBER
%% =====================================
%% Description: Format single jury member entry

%% Command to add jury member
%% Parameters:
%% #1: Name
%% #2: Role (director, examiner, etc.)
%% #3: Affiliation (university, lab)
\newcommand{\Jury}[3]{%
  \textbf{#1} & \multirow{2}{*}{\footnotesize \hspace{-0cm} #2}\\
  % First row: bold name, role in multirow
  \footnotesize \textsl{#3} & \\
  % Second row: italic affiliation
}

%% =====================================
%% JURY COMPOSITION ENVIRONMENT
%% =====================================
%% Description: Environment for listing all jury members

%% Environment for jury composition block
%% Parameter: #1 = Section title (e.g., "Jury composition:")
\newenvironment{FPComposition}[1]{%
  \large % Start with large font
  \textbf{#1}\bigskip{} % Bold title with space after
  
  \small % Switch to small font
  \hspace{2.6cm} % Indent table
  % Start two-column table
  \begin{tabular}{p{.3\columnwidth} l}
}{%
  \end{tabular} % End table
}
%% Usage:
%% \begin{FPComposition}{Jury:} % Thesis Committee
%% \Jury{Name}{Role}{University}
%% \Jury{Name}{Role}{University}
%% \end{FPComposition}

%% =====================================
%% DEBUG FRAME
%% =====================================
%% Description: Draw circles at page corners for alignment checking

%% Command to draw frame for debugging
%% Draws small circles at all corner and edge positions
%% Useful for checking page alignment, margins, etc.
\newcommand{\Frame}{%
  \begin{tikzpicture}[remember picture,overlay]
    \foreach \bound in {north,south,west,east,north east,north west,south east, south west} {
      % Loop through all 8 positions
      % Draw 2mm radius circle at each position
      \draw ([xshift=0cm,yshift=0cm] current page.\bound) circle [radius=2mm];
    }
  \end{tikzpicture}
}
%% Usage: \Frame in document to see alignment markers

%% =====================================
%% CUSTOM MACROS - LOREM IPSUM
%% =====================================
%% Description: Generate placeholder text for testing

%% lipsum: Generate Lorem Ipsum text
%% Provides: \lipsum[paragraphs]
%% Standard placeholder text for layout testing
\RequirePackage{lipsum}

%% Define convenience commands for different text lengths
%% "baratin" = "waffle" in French (meaningless filler text)

%% Very brief: 2 sentences
\newcommand{\lorembrief}{\lipsum[1][1-2]}
%% Short: 2 sentences (same as brief)
\newcommand{\loremshort}{\lipsum[1][1-2]}
%% Small: 4 sentences
\newcommand{\loremsmall}{\lipsum[1][1-4]}
%% Medium: 6 sentences
\newcommand{\loremmedium}{\lipsum[1][1-6]}
%% Long: 8 sentences (1 paragraph)
\newcommand{\loremlong}{\lipsum[1][1-8]}
%% Very long: 16 sentences (2 paragraphs)
\newcommand{\loremverylong}{\lipsum[1][1-16]}
%% Too long: 32 sentences (4 paragraphs)
\newcommand{\loremtoolong}{\lipsum[1][1-32]}

%% =====================================
%% LETTRINE - DECORATIVE DROP CAPS
%% =====================================
%% Description: Large decorative initial letters for paragraphs

%% lettrine: Package for drop caps
\RequirePackage{lettrine}

%% Define custom font family for lettrine
%% TeX Gyre Bonum: Elegant serif font based on Bookman
\newfontfamily\lettrinefont{TeX Gyre Bonum}[
  Scale=1.0,
  BoldFont={TeX Gyre Bonum Bold}
]

%% Custom lettrine command with fixed parameters
%% \mylettrine{B}{ienvenue} creates a 3-line drop cap
%% Parameters:
%% - lines=3: Drop cap spans 3 lines
%% - findent=8pt: First line indent (space after the letter)
%% - nindent=0pt: Following lines indent (aligned with margin)
\newcommand{\mylettrine}[2]{%
  \lettrine[lines=3, findent=8pt, nindent=0pt]{\lettrinefont #1}{#2}%
}

%% =====================================
%% TIKZ GRAPHICS MACROS
%% =====================================
%% Description: Convenience commands for TikZ coordinate systems

%% Draw X axis with numbers
%% Parameters: #1 = start value, #2 = end value
%% Example: \AxeX{0}{10} draws x-axis from 0 to 10
\newcommand{\AxeX}[2]{%
  \foreach \x in {#1,...,#2} {
    % Loop through all integer values
    \draw[below](\x,0) node{\x};
    % Draw number below point (x,0)
  }
}

%% Draw Y axis with numbers
%% Parameters: #1 = start value, #2 = end value
%% Example: \AxeY{0}{10} draws y-axis from 0 to 10
\newcommand{\AxeY}[2]{%
  \foreach \y in {#1,...,#2} {
    % Loop through all integer values
    \draw[left](0,\y) node{\y};
    % Draw number left of point (0,y)
  }
}

%% Draw grid
%% Parameters: #1,#2 = bottom-left corner, #3,#4 = top-right corner
%% Example: \Grille{0}{0}{10}{10} draws 10×10 grid
\newcommand{\Grille}[4]{%
  \draw[thin,lightgray](#1,#2)grid(#3,#4);
  % Draw thin gray grid from (#1,#2) to (#3,#4)
}

%% Draw complete coordinate system (grid + axes)
%% Parameters: #1,#2 = bottom-left, #3,#4 = top-right
%% Combines \Grille, \AxeX, and \AxeY
\newcommand{\Repere}[4]{%
  \Grille{#1}{#2}{#3}{#4} % Draw grid
  \AxeX{#1}{#3} ; % Draw X axis
  \AxeY{#2}{#4} % Draw Y axis
}

%% =====================================
%% IMAGE MACROS
%% =====================================
%% Description: Simplified image inclusion commands

%% Insert image with frame
%% Parameters: 
%%   [#1] = width ratio (optional, default 1.0)
%%   #2 = image filename
%% Example: \Image[0.5]{photo.jpg} inserts at 50% width
\newcommand{\Image}[2][1.0]{%
  \fbox{ % Add frame around image
    \includegraphics[width=#1\columnwidth]{#2}
    % Scale to fraction of column width
  }%
}

%% =====================================
%% CUSTOM ENVIRONMENTS
%% =====================================
%% Description: Special box environments for notices

%% Attention environment (warning box)
%% Parameter: #1 = title text
%% Creates red-framed box with title
\newenvironment{Attention}[1]{%
  % Opening code
  {\color{red} % Red color
   \hrulefill{}\hfill{} % Left line
   \textbf{#1} % Bold title
   \hfill{}\hrulefill{} % Right line
  }
}{
  % Closing code
  {\color{red}\hrulefill{}} % Bottom line in red
}
%% Usage:
%% \begin{Attention}{Warning!}
%%   Important text here
%% \end{Attention}

%% =====================================
%% TEXT MACROS
%% =====================================
%% Description: Convenience commands for common text formatting

%% English quotation marks
%% \enquote{#1}

%% Alternative: French-style quotes (if needed for special cases)
%% Parameter: #1 = quoted text
%% Usage: \Guillemets{text} produces « text »
%% Adds non-breaking spaces before/after for French typography
% \newcommand{\Guillemets}[1]{«~{#1}~»}

%% Trademark symbol
%% Parameter: #1 = brand name
%% Usage: \brand{Brand} produces "Brand™"
%% Name in italic with trademark symbol
\newcommand{\brand}[1]{\textsl{#1}\texttrademark}

%% Middle dot (interpunct/point médian)
%% Used in inclusive writing: auteur·rice, étudiant·e
%% Parameter: #1 = (unused)
\newcommand{\mdot}[1]{·}

%% Greater than or equal with custom argument
%% Parameter: #1 = value
%% Usage: \Geq{5} produces "≥ 5"
\newcommand{\Geq}[1]{\ensuremath{\geqslant #1}}

%% =====================================
%% BUG FIXES
%% =====================================
%% Description: Compatibility fixes

%% Fix for AtPageLowerRight command
%% Some packages expect this command but it may be undefined
%% This provides a dummy version that just outputs content
\newcommand{\AtPageLowerRight}[1]{#1}

%% End asset/thesis.cls
\endinput