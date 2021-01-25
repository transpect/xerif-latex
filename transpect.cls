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
\def\fileversion{0.94}%
\def\filedate{2021-01-25}%

\message{le-tex transpect package version \fileversion\space (\filedate)^^J}

\def\includeDTX#1{\input src/#1.dtx}

%%
%% Common document class for le-tex Transpect projects.
%%
%% Maintainer: p.schulz@le-tex.de
%%
%% lualatex  -  texlive > 2019
%%
\NeedsTeXFormat{LaTeX2e}[2019/01/01]
\ProvidesClass{transpect}
    [\filedate \fileversion le-tex transpect]
\RequirePackage{kvoptions-patch}%%%NEW
\RequirePackage{xkeyval}
\RequirePackage{transpect-helpers}
\PassOptionsToPackage{cmyk}{xcolor}
 %\PassOptionsToPackage{endnotes,resetnotesperchapter,endnotesperchapter}{transpect-endnotes}
 %\PassOptionsToPackage{}{transpect-script}
\newif\ifcollection \collectionfalse
\newif\ifhasparts \haspartsfalse
\DeclareOptionX{book}{\global\collectionfalse}
\DeclareOptionX{collection}{\global\collectiontrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptionsX
\LoadClass[10pt,a4paper]{book}
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

\usepackage{color}
\usepackage{graphicx}
\usepackage{soul}
\PassOptionsToPackage{breaklinks,linktocpage,pdfborder={0 0 0},pdfencoding=auto,bookmarksnumbered=true}{hyperref}
\usepackage{transpect-headings}
\usepackage{transpect-floats}
\RequirePackage{transpect-endnotes}
 % \RequirePackage{transpect-title}
\RequirePackage{hyperref}

\endinput
%%
%% End of file `transpect.cls'.
