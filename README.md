# PhD Thesis LaTeX Template :mortar_board:

[![LaTeX](https://img.shields.io/badge/LaTeX-Template-green.svg)](https://www.latex-project.org/)
[![Overleaf](https://img.shields.io/badge/Overleaf-Compatible-green.svg)](https://www.overleaf.com/)
[![LuaLaTeX](https://img.shields.io/badge/LuaLaTeX-Compatible-brightgreen.svg)](http://www.luatex.org/)
[![English](https://img.shields.io/badge/Language-English-blue.svg)](https://github.com/dylan-moinse/phd-thesis-latex-template)
[![French](https://img.shields.io/badge/Langue-Français-blue.svg)](https://github.com/dylan-moinse/phd-thesis-latex-template)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/dylan-moinse/phd-thesis-latex-template/graphs/commit-activity)
[![Email](https://img.shields.io/badge/Email-Contact-red.svg)](mailto:dylan.moinse@unil.ch)

A comprehensive and modern designed LaTeX template specifically tailored for **PhD theses**.



---

## Table of Contents :telescope:

- [Quick Start :rocket:](#quickstart)
- [Template Structure :world_map:](#templatestructure)
- [Screenshots :scissors:](#screenshots)
- [Reference Thesis :dart:](#referencethesis)
- [Contact :email:](#contact)
- [Contributors :handshake:](#contributors)



---

<h2 id="quickstart"> Quick Start :rocket: </h2>

This template is designed to be used **either directly on Overleaf** or **locally via Git**.


### Option 1: Use on **Overleaf** :computer:

The easiest way to get started is to use this template on **Overleaf**, with **no local installation required**.

1. Go to **Overleaf**: https://www.overleaf.com/

2. Create a new project  
   - Click **New Project**
   - Select **Import from GitHub**

3. Paste the repository URL:
   ```text
   https://github.com/dylan-moinse/phd-thesis-latex-template
   ```

4. Set the compiler to LuaLaTeX

5. Compile `main.tex`

### Option 2: **Clone** and Compile Locally :hammer:

If you prefer working **locally** (offline compilation):

1. Clone the repository:
   ```bash
   git clone https://github.com/dylan-moinse/phd-thesis-latex-template.git
   cd phd-thesis-template
   ```

2. Install LaTeX distribution
   - **Windows**: Install [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
   - **macOS**: Install [MacTeX](https://www.tug.org/mactex/)
   - **Linux (Debian/Ubuntu)**:
     ```text
     sudo apt-get install texlive-full
     ```

3. Compile the document
   - Using LuaLaTeX (*recommended*):
     ```bash
     lualatex main.tex
     biber main
     lualatex main.tex
     lualatex main.tex
     ```
   - Using latexmk (*automated*):
     ```bash
     latexmk -pdf main.tex
     ```



---

<h2 id="templatestructure"> Template Structure :world_map: </h2>

```
phd-thesis-latex-template/         # Root directory of the thesis template
│
├── main.tex                       ## Main document file
├── latexmkrc                      ## Compilation configuration
├── LICENSE                        ## MIT license
├── README.md                      ## GitHub README
│
├── asset/                         ## Document class and style definitions
│   ├── thesis.cls                 ### Main document class
│   ├── bib/                       ### Bibliography database
│   │   └── references.bib         #### References
│   └── style/                     ### Modular style files
│       ├── bib.sty                #### Bibliography configuration
│       ├── color.sty              #### Color scheme
│       ├── fig.sty                #### Figures, maps, tables, and equations
│       ├── font.sty               #### Font configuration
│       ├── header.sty             #### Headers and footers
│       ├── section.sty            #### Part/chapter formatting and backgrounds
│       └── fonts/                 #### Custom font files
│
├── content/                       ## Thesis content
│   ├── front-matter/              ### Preliminary pages
│   │   ├── 01-frontpage.tex       #### Title page
│   │   ├── 02-acknowledgments.tex #### Acknowledgments section
│   │   ├── 03-cite.tex            #### Cite the document
│   │   └── 04-foreword.tex        #### Preface
│   │
│   ├── main-matter/               ### Core thesis chapters
│   │   ├── introduction.tex       #### General introduction
│   │   ├── part1/                 #### First thesis part
│   │   │   ├── introduction.tex   ##### Part introduction
│   │   │   └── conclusion.tex     ##### Part conclusion
│   │   ├── chap1/                 #### Chapter 1 content
│   │   │   ├── introduction.tex   ##### Chapter introduction
│   │   │   ├── content.tex        ##### Chapter body (structure)
│   │   │   ├── section1.tex       ##### Chapter section 1
│   │   │   ├── section2.tex       ##### Chapter section 2
│   │   │   ├── section3.tex       ##### Chapter section 3
│   │   │   └── conclusion.tex     ##### Chapter conclusion
│   │   ├── chap2/                 #### Chapter 2 content
│   │   │   ├── introduction.tex   ##### Chapter introduction
│   │   │   ├── content.tex        ##### Chapter body (structure)
│   │   │   ├── section1.tex       ##### Chapter section 1
│   │   │   ├── section2.tex       ##### Chapter section 2
│   │   │   ├── section3.tex       ##### Chapter section 3
│   │   │   └── conclusion.tex     ##### Chapter conclusion
│   │   └── conclusion.tex         #### General conclusion
│   │
│   └── back-matter/               ### Final thesis sections
│       ├── 95-bibliography.tex    #### Bibliography printing
│       ├── 96-index.tex           #### Index generation
│       ├── 97-acronyms.tex        #### Acronyms list
│       ├── 98-glossary.tex        #### Glossary entries
│       ├── 99-abstract.tex        #### Thesis abstract
│       └── appendices/            #### Appendices
│           ├── 00-first-page.tex  ##### Appendix title page
│           ├── 01-appendix-a.tex  ##### Appendix A
│           ├── 01-appendix-b.tex  ##### Appendix B
│           ├── 01-appendix-c.tex  ##### Appendix C
│           ├── 01-appendix-d.tex  ##### Appendix D
│           ├── 01-appendix-e.tex  ##### Appendix E
│           ├── 01-appendix-f.tex  ##### Appendix F
│           └── 02-appendix-g.tex  ##### Appendix G
│
├── elements/                      ## Figures, maps, tables, equations, and graphical abstracts
│   ├── figures/                   ### Figure folder
│   │   ├── fig01.tex              #### Figure example
│   │   ├── fig02.tex              #### Figure example
│   │   ├── fig03.tex              #### Figure example
│   │   ├── fig04.tex              #### Figure example
│   │   └── pic/                   #### Image files
│   ├── maps/                      ### Map folder
│   │   ├── map01.tex              #### Map example
│   │   └── pic/                   #### Image files
│   ├── tables/                    ### Table folder
│   │   └── table01.tex            #### Table example
│   ├── equations/                 ### Equation folder
│   │   └── equation01.tex         #### Equation example
│   ├── graphical-abstract/        ### Graphical abstract files
│   └── appendices/                ### Appendix-specific elements
│       ├── figures/               #### Appendix figures
│       └── maps/                  #### Appendix maps
│
└── extra/                         ## Additional resources
    │   github/                    ### Screenshots for README
    └── logo/                      # Institutional and partner logo example
```



---

<h2 id="screenshots"> Screenshots :scissors: </h2>

A selection of examples showcasing the structure and style of this extensive template:

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-01.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Cover Page</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-03.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Acknowledgments Page</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-05.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>General Table of Contents</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-07.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>List of Figures</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-09.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>List of Maps Page</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-11.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>List of Tables</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-13.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>List of Equations</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-15.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>How to Cite this Document</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-17.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>Preface</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-21.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Content of the General Introduction</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-25.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Title of Part I</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-29.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>Title of Chapter 1</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-31.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Chapter Table of Contents</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-32.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Chapter Graphical Abstract</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-33.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>Chapter Abstract</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-35.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Chapter Content</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-37.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Section Content</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-39.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>Table Example</b></sub>
      </td>
    </tr>
  </tbody>
</table>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-41.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Chapter Subbibliography</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-63.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Author Index</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-65.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>List of Acronyms</b></sub>
      </td>
    </tr>
  </tbody>
</table>


<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-67.jpg" width="250px;" alt="Image 1"/>
        <br />
        <sub><b>Glossary</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-69.jpg" width="250px;" alt="Image 2"/>
        <br />
        <sub><b>Appendices</b></sub>
      </td>
      <td align="center" valign="top" style="width: 33%;">
        <img src="extra/github/screen-page-71.jpg" width="250px;" alt="Image 3"/>
        <br />
        <sub><b>Appendices Table of Contents</b></sub>
      </td>
    </tr>
  </tbody>
</table>



---

<h2 id="referencethesis"> Reference Thesis :dart: </h2>

This LaTeX template has been developed, applied, and continuously improved during the preparation of my doctoral thesis, written in French and translated into English.

The complete PhD thesis is publicly available (see the [HAL archive](https://hal.science/tel-05160113v1) and the [GitHub repository](https://github.com/dylan-moinse/PhD_Thesis_Dylan_MOINSE_French)).



---

<h2 id="contact"> Contact :email: </h2>

For any questions or contributions, feel free to contact me via *GitHub Issues* or email.



---

<h2 id="contributors"> Contributors :handshake: </h2>

<table style="width: 100%;">
  <tbody>
    <tr>
      <td align="center" valign="top" style="width: 25%;">
        <a href="https://github.com/dylan-moinse">
          <img src="https://www.lvmt.fr/wp-content/uploads/2020/12/mmexport1724838810337_2-150x190.jpg" width="100px;" alt="Dylan Moinse"/>
          <br />
          <sub><b>Dylan Moinse</b></sub>
        </a>
        <br />
        <sub>Author</sub>
        <br />
        <a href="https://github.com/all-contributors/app/commits?author=dylan-moinse" title=""></a>
      </td>
      <td align="center" valign="top" style="width: 25%;">
        <a href="https://github.com/alainlhostis">
          <img src="https://www.lvmt.fr/wp-content/uploads/2016/12/IMG_20221123_102303_rognee-150x190.jpg" width="100px;" alt="Alain L'Hostis"/>
          <br />
          <sub><b>Alain L'Hostis</b></sub>
        </a>
        <br />
        <sub>Thesis Supervisor</sub>
        <br />
        <a href="https://github.com/all-contributors/app/commits?author=alainlhostis" title=""></a>
      </td>
      <td align="center" valign="top" style="width: 25%;">
        <a href="">
          <sub><b>Jorge Mariano</b></sub>
        </a>
        <br />
        <sub>Technical Support</sub>
        <br />
      </td>
            <td align="center" valign="top" style="width: 25%;">
        <a href="https://github.com/iaguas">
          <img src="https://avatars.githubusercontent.com/u/4259550?v=4" width="100px;" alt="Iñigo Aguas Ardaiz"/>
          <br />
          <sub><b>Iñigo Aguas Ardaiz</b></sub>
        </a>
        <br />
        <sub>Technical Support</sub>
        <br />
        <a href="https://github.com/all-contributors/app/commits?author=alainlhostis" title=""></a>
      </td>
    </tr>
  </tbody>
</table>
