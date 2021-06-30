%%
%% This is file `transpect.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% transpect.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from transpect.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file transpect.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\def\fileversion{0.99}%
\def\filedate{2021-06-30}%


\message{le-tex transpect package version \fileversion\space (\filedate)^^J}

\def\includeDTX#1{\input src/#1.dtx}

%%
%% Common document class for le-tex Transpect projects.
%%
%% Maintainer: p.schulz@le-tex.de
%%
%% lualatex  -  texlive > 2019
%%
\NeedsTeXFormat{LaTeX2e}[2018/12/01]
\ProvidesClass{transpect}
    [\filedate \fileversion le-tex transpect]
\RequirePackage{kvoptions-patch}
\RequirePackage{xkeyval}
\RequirePackage{transpect-common}
\PassOptionsToPackage{cmyk}{xcolor}
\PassOptionsToPackage{shorthands=off}{babel}
\DeclareOptionX{endnotes}{\PassOptionsToPackage{\CurrentOption}{transpect-endnotes}}
\DeclareOptionX{resetnotesperchapter}{\PassOptionsToPackage{\CurrentOption}{transpect-endnotes}}
\DeclareOptionX{endnotesperchapter}{\PassOptionsToPackage{\CurrentOption}{transpect-endnotes}}
\newif\ifcollection \collectionfalse
\newif\if@article \@articlefalse
\DeclareOptionX{book}{\global\collectionfalse\global\@articlefalse}
\DeclareOptionX{article}{\global\collectionfalse\global\@articletrue}
\DeclareOptionX{collection}{\global\collectiontrue\global\@articlefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptionsX
\if@article
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
\if@article\else
  \newif\if@frontmatter  \@frontmatterfalse
  \renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \@frontmattertrue
    \pagenumbering{arabic}}

  \renewcommand\mainmatter{%
    \cleardoublepage
    \@frontmatterfalse
    \@mainmattertrue}

  \renewcommand\backmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \@frontmatterfalse}
\fi
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{soul}
\PassOptionsToPackage{breaklinks,linktocpage,pdfborder={0 0 0},pdfencoding=auto,bookmarksnumbered=true}{hyperref}
\RequirePackage{transpect-headings}
\RequirePackage{transpect-floats}
\RequirePackage{transpect-endnotes}
 % \RequirePackage{transpect-title}
\RequirePackage{index}
\makeindex
\RequirePackage{hyperref}

\endinput
%%
%% End of file `transpect.cls'.
