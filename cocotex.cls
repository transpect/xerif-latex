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
    [2025/04/24 v0.5.0 cocotex]
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
\newif\ifcollection
\newif\ifarticle
\newif\ifmonograph
\newif\ifjournal
\keys_define:nn { cocotex/cls }
{
  pubtype .choices:nn = { collection, article, journal, mono }
  {
    \global\collectionfalse
    \global\articlefalse
    \global\monographfalse
    \global\journalfalse
    \str_case:Vn \l_keys_choice_tl
    {
      { collection } { \global\collectiontrue }
      { article }    { \global\articletrue    }
      { journal }    { \global\journaltrue    }
      { mono }       { \global\monographtrue  }
    }
  },
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
\str_new:N \g_cc_pdf_standard_str
\keys_define:nn { cocotex/cls }
{
  pdf-standard .code:n =
    {
      \exp_args:Nnx
      \keys_set:nn {cocotex/cls} {_pdfstandard=\str_uppercase:n{#1}}
    },
  _pdfstandard .str_set:N = \g_cc_pdf_standard_str,
  _pdfstandard .initial:n = A-2A,
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
\cs_if_exist:NT \ccClassOptions{\exp_args:Nnx\keys_set:nn {cocotex/cls}{\ccClassOptions}}
\sys_ensure_backend:
\seq_new:N \g_cc_pdfstd_seq
\seq_const_from_clist:Nn \g_cc_pdfstd_macros_seq {cc@pdf@std, cc@pdf@part, cc@pdf@level, cc@pdf@issue }
\regex_extract_all:nVN { ^([UAX]+)\-([0-9]+)([A-Z]*)?:?(.*)? } \g_cc_pdf_standard_str \g_cc_pdfstd_seq
\seq_pop_left:NN \g_cc_pdfstd_seq \l_tmpa_tl
\cs_new:Npn \cc_map_pdfstd:nn #1#2 {%
  \str_if_empty:nTF { #1 }
    {\cs_gset:cpn{#2}{}}
    {\cs_gset:cpe{#2}{\str_if_eq:nnTF{#1}{UA}{U}{#1}}}
}
\seq_map_pairwise_function:NNN \g_cc_pdfstd_seq \g_cc_pdfstd_macros_seq \cc_map_pdfstd:nn
\prg_generate_conditional_variant:Nnn \regex_match_case:nn {nV} {T,F,TF}
\regex_match_case:nVF
  {
    { ^UA\-1 }   { \pdf_version_gset:n { 1.7 } \PassOptionsToPackage{init}{coco-accessibility} }
    { ^UA\-2 }   { \pdf_version_gset:n { 2.0 } \PassOptionsToPackage{init}{coco-accessibility} \global\@cc@pdf@twotrue }
    { ^A\-1 }    { \pdf_version_gset:n { 1.4 } }
    { ^A\-[23] } { \pdf_version_gset:n { 1.7 } }
    { ^A\-4 }    { \pdf_version_gset:n { 2.0 } \global\@cc@pdf@twotrue }
    { ^X\-[123] }{ \pdf_version_gset:n { 1.4 } }
    { ^X\-[45] } { \pdf_version_gset:n { 1.6 } }
    { ^X\-6 }    { \pdf_version_gset:n { 2.0 } \global\@cc@pdf@twotrue }
  } \g_cc_pdf_standard_str
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
\if\cc@pdf@std X
  \hypersetup{draft}
  \AddToHook{begindocument}{%
    \@ifpackageloaded{coco-frame.sty}{}{%
      \RequirePackage[pdfboxes]{coco-frame}%
    }%
  }%
\fi
\ccAfterClassHook
\endinput
%%
%% End of file `cocotex.cls'.
