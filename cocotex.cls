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
    [2025/02/07 v0.5.0 cocotex]
\SetDefaultHookLabel{cc}
\ExplSyntaxOn
\keys_define:nn { cocotex/cls }
{
  main .code:n = { \PassOptionsToPackage{main=#1}{babel} },
  es-noindentfirst .code:n = { \PassOptionsToPackage{es-noindentfirst}{babel} },
  es-noshorthands  .code:n = { \PassOptionsToPackage{es-noshorthands}{babel} }
}
\PassOptionsToPackage{shorthands=off}{babel}
\keys_define:nn { cocotex/cls }
{
  no-hyperindex .code:n = {\global\let\cc@no@hyperindex\relax}
}
\newif\ifcollection \collectionfalse
\newif\ifarticle    \articlefalse
\newif\ifmonograph  \monographfalse
\newif\ifjournal    \journalfalse
\keys_define:nn { cocotex/cls }
{
  pubtype .choice:,
  pubtype / collection .code:n = { \global\collectiontrue },
  pubtype / article    .code:n = { \global\articletrue    },
  pubtype / journal    .code:n = { \global\journaltrue    },
  pubtype / mono       .code:n = { \global\monographtrue  },
  pubtype           .initial:n = mono,
}
\keys_define:nn { cocotex/cls }
{
  prefix .code:n = { \PassOptionsToPackage{prefix=#1}{coco-kernel} },
  debug        .code:n = { \PassOptionsToPackage{debug}{coco-kernel} },
  debug-domain .code:n = { \PassOptionsToPackage{debug-domain=#1}{coco-kernel} },
  silent       .code:n = {\PassOptionsToPackage{silent}{coco-common}},
   nofigs      .code:n = {\PassOptionsToPackage{nofigs}{coco-floats}},
}
\newif\if@cc@pdf@two \@cc@pdf@twofalse
\keys_define:nn { cocotex/cls }
{
  pdf-standard .code:n =
    {
      \exp_args:Nnx
      \keys_set:nn {cocotex/cls} {_pdfstandard=\str_uppercase:n{#1}}
    },
  _pdfstandard .choices:nn =
    {
      A-1B, A-1A, A-2B, A-2A, A-2U, A-3B, A-3A, A-3U, A-4,
      X-3, X-4, X-4P, X-5G, X-5N, X-5PG, X-6, X-6N, X-6P,
      UA-1, UA-2
    }
    {
      \xdef\cc@pdf@standard{ \tl_use:N \l_keys_choice_tl }
      \xdef\cc@pdf@std{\expandafter\@car\cc@pdf@standard\@nil}
    },
  _pdfstandard .initial:n = A-2B,
  _pdfstandard / unknown .code:n =
    { \msg_warning:nnn{pdf}{unknown-standard}{#1} },
  a11y         .code:n = { \keys_set:nn { cocotex/cls } { pdf-standard = UA-1 } },
  a11y20       .code:n = { \keys_set:nn { cocotex/cls } { pdf-standard = UA-2 } },
  lang-id      .code:n = {},
  nodetree     .code:n = {\PassOptionsToPackage{nodetree}{coco-accessibility}},
  show-spaces  .code:n = {\PassOptionsToPackage{show-spaces}{coco-accessibility}},
  no-spaces    .code:n = {\PassOptionsToPackage{no-spaces}{coco-accessibility}},
  no-paras     .code:n = {\PassOptionsToPackage{no-paras}{coco-accessibility}},
  no-compress  .code:n =
  {
    \sys_ensure_backend:
    \ifx\pdfobjcompresslevel\@undefined
      \edef\pdfobjcompresslevel{\pdfvariable objcompresslevel}%
    \fi
    %\pdfcompresslevel=0
    \pdfobjcompresslevel=0
    \pdf_uncompress:
  },
  color-enc    .code:n = {\PassOptionsToPackage{color-enc=#1}{coco-common}},
  usescript    .code:n = {\PassOptionsToPackage{usescript={#1}}{coco-script}},
  endnotes     .code:n = {\PassOptionsToPackage{endnotes}{coco-notes}},
  ennotoc      .code:n = {\PassOptionsToPackage{ennotoc}{coco-notes}},
  endnoteswithchapters .code:n = {\PassOptionsToPackage{endnoteswithchapters}{coco-notes}},
  resetnotesperchapter .code:n = {\PassOptionsToPackage{resetnotesperchapter}{coco-notes}},
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\ProcessKeyOptions[cocotex/cls]
\sys_ensure_backend:
\prg_generate_conditional_variant:Nnn \regex_match_case:nn {nV} {T,F,TF}
\regex_match_case:nVF
  {
    { ^UA\-1 }   { \pdf_version_gset:n { 1.7 } \PassOptionsToPackage{init}{coco-accessibility} }
    { ^UA\-2 }   { \pdf_version_gset:n { 2.0 } \PassOptionsToPackage{init}{coco-accessibility} }
    { ^A\-1 }    { \pdf_version_gset:n { 1.4 } }
    { ^A\-[23] } { \pdf_version_gset:n { 1.7 } }
    { ^A\-4 }    { \pdf_version_gset:n { 2.0 } }
    { ^X\-[123] }{ \pdf_version_gset:n { 1.4 } }
    { ^X\-[45] } { \pdf_version_gset:n { 1.6 } }
    { ^X\-6 }    { \pdf_version_gset:n { 2.0 } }
  } \cc@pdf@standard
  { \pdf_version_gset:n { 1.7 } }
\ExplSyntaxOff
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
\if\cc@pdf@std X
  \let\href\relax
  \RequirePackage{nohyperref}
\else
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
\fi
\ccAfterClassHook
\endinput
%%
%% End of file `cocotex.cls'.
