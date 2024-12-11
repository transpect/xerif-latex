%%
%% This is file `cocotex.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cocotex.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from cocotex.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file cocotex.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%%
%% Common document class for \textit{xerif} projects.
%%
%% Maintainer: p.schulz@le-tex.de
%%
\NeedsTeXFormat{LaTeX2e}[2023/11/01]
\ProvidesClass{cocotex}
    [2024/07/16 v0.5.0 cocotex]
\RequirePackage{xkeyval}
\SetDefaultHookLabel{cc}
\DeclareOptionX{main}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{es-noindentfirst}{\PassOptionsToPackage{es-noindentfirst}{babel}}
\DeclareOption{es-noshorthands}{\PassOptionsToPackage{es-noshorthands}{babel}}
\PassOptionsToPackage{shorthands=off}{babel}
\DeclareOption{no-hyperindex}{\global\let\cc@no@hyperindex\relax}
\newif\ifcollection \collectionfalse
\newif\ifarticle    \articlefalse
\newif\ifmonograph  \monographfalse
\newif\ifjournal    \journalfalse
\define@choicekey{cocotex.cls}{pubtype}[\cc@pub@type\nr]{collection,article,journal,mono}{%
  \ifcase\nr\relax% collection
    \global\collectiontrue
  \or% article
    \global\articletrue
  \or% journal
    \global\journaltrue
  \else% monograph
    \global\monographtrue
  \fi
}
\DeclareOptionX{prefix}{\PassOptionsToPackage{\CurrentOption}{coco-kernel}}
\DeclareOptionX{debug}{\PassOptionsToPackage{\CurrentOption}{coco-kernel}}
\DeclareOptionX{debug-domain}{\PassOptionsToPackage{\CurrentOption}{coco-kernel}}
\DeclareOptionX{silent}{\PassOptionsToPackage{\CurrentOption}{coco-common}}
\DeclareOptionX{nofigs}{\PassOptionsToPackage{\CurrentOption}{coco-floats}}
\newif\if@cc@pdf@two \@cc@pdf@twofalse
\let\cc@pdf@std A
\ExplSyntaxOn
\keys_define:nn { cocotex/cls }
{
  pdf-standard .choice:,
  pdf-standard / X .code:n = { \let\cc@pdf@std X },
  pdf-standard / A .code:n = { \let\cc@pdf@std A },
  pdf-standard / UA .code:n =
  {
    \let\cc@pdf@std U
    \PassOptionsToPackage{init}{coco-accessibility}%
  },
  pdf-standard .initial:n = A,
  pdf-version .choices:nn =
    { 1.3, 1.4, 1.5, 1.6, 1.7, 2.0 }
    {
      \sys_ensure_backend:
      \exp_args:Ne\pdf_version_gset:n{\tl_use:N \l_keys_choice_tl}
    },
  pdf-version .initial:n = { 1.7 },
}
  % LEGACY
  \DeclareOptionX{a11y}{%
    \sys_ensure_backend:
    \pdf_version_gset:n{1.7}%
    \PassOptionsToPackage{init}{coco-accessibility}}%
  \DeclareOptionX{a11y20}{%
    \global\@cc@pdf@twotrue
    \sys_ensure_backend:
    \pdf_version_gset:n{2.0}%
    \PassOptionsToPackage{init}{coco-accessibility}}%
\ExplSyntaxOff
\DeclareOptionX{lang-id}{}
\DeclareOptionX{nodetree}{\PassOptionsToPackage{\CurrentOption}{coco-accessibility}}
\DeclareOptionX{showspaces}{\PassOptionsToPackage{\CurrentOption}{coco-accessibility}}
\DeclareOptionX{no-spaces}{\PassOptionsToPackage{\CurrentOption}{coco-accessibility}}
\DeclareOptionX{no-paras}{\PassOptionsToPackage{\CurrentOption}{coco-accessibility}}
\DeclareOptionX{no-compress}{\let\cc@no@pdf@compression\relax}
\DeclareOptionX{color-enc}{\PassOptionsToPackage{\CurrentOption}{coco-common}}
\DeclareOptionX{usescript}{\PassOptionsToPackage{\CurrentOption}{coco-script}}
\DeclareOptionX{endnotes}{\PassOptionsToPackage{\CurrentOption}{coco-notes}}
\DeclareOptionX{ennotoc}{\PassOptionsToPackage{\CurrentOption}{coco-notes}}
\DeclareOptionX{endnoteswithchapters}{\PassOptionsToPackage{\CurrentOption}{coco-notes}}
\DeclareOptionX{resetnotesperchapter}{\PassOptionsToPackage{\CurrentOption}{coco-notes}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}}
\ExplSyntaxOn
  \ProcessOptionsX
  \ProcessKeyOptions[cocotex/cls]

\ExplSyntaxOff
\if\cc@pdf@std U
    \PassOptionsToPackage{init}{coco-accessibility}%
\fi
\def\ccAfterClassHook{}
\def\ccToggleCountedConditionalsHook{}%
\RequirePackage{coco-common}
\ifarticle
  \LoadClass[10pt,a4paper]{article}
\else
  \LoadClass[10pt,a4paper]{book}
\fi
\voffset-1in\relax
\hoffset-1in\relax
\emergencystretch=2em
\frenchspacing
\clubpenalty10000
\widowpenalty10000
\def\ps@empty{%
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\newif\if@frontmatter  \@frontmatterfalse
\newif\if@mainmatter   \@mainmatterfalse
\newif\if@backmatter   \@backmatterfalse
\ifarticle\else
  \renewcommand\frontmatter{%
    \cleardoublepage
    \cchResetNesting
    \global\@mainmatterfalse
    \global\@backmatterfalse
    \global\@frontmattertrue
    \ccaVstructStart{Frontmatter}%
    \pagenumbering{arabic}}
  \renewcommand\mainmatter{%
    \if@frontmatter\ccaVstructEnd{Frontmatter}\fi
    \cleardoublepage
    \cchResetNesting
    \global\@frontmatterfalse
    \global\@backmatterfalse
    \global\@mainmattertrue
    \ccaVstructStart{Mainmatter}%
  }
  \renewcommand\backmatter{%
    \if@mainmatter\ccaStructEnd{Mainmatter}\fi%
    \cleardoublepage
    \cchResetNesting
    \global\@mainmatterfalse
    \global\@frontmatterfalse
    \global\@backmattertrue
    \ccaVstructStart{Backmatter}%
  }
\fi% \ifarticle
\RequirePackage{coco-accessibility}
\ifLuaTeX
\RequirePackage{coco-script}
\else
\RequirePackage{babel}
\fi
\RequirePackage{coco-headings}
\RequirePackage{coco-floats}
\RequirePackage{coco-title}
\RequirePackage{coco-notes}
\RequirePackage{index}
\makeindex
\RequirePackage{hyperref}
\hypersetup{%
    breaklinks%
   ,linktoc=none%
   ,pdfborder={0 0 0}%
   ,pdfencoding=unicode
   ,unicode=true
   ,bookmarksnumbered=true%
   ,bookmarksopen=false%
   ,hyperindex=\ifx\cc@no@hyperindex\relax false\else true\fi
}
\ifx\cc@no@pdf@compression\relax
  \ifx\pdfobjcompresslevel\@undefined
    \edef\pdfobjcompresslevel{\pdfvariable objcompresslevel}%
  \fi
  \pdfcompresslevel=0
  \pdfobjcompresslevel=0
\fi
\ccAfterClassHook
\endinput
%%
%% End of file `cocotex.cls'.
