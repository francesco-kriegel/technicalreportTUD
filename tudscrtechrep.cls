% Author: Francesco Kriegel (francesco@tcs.inf.tu-dresden.de)
% Last Update: 2017/10/12

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tudscrtechrep}[2017/11/12 LaTeX Class for Technical Reports in TUD Corporate Design (based on KOMA-Script class tudscrreprt)]

\LoadClass[cdmath=off,cd=bicolor,cdfoot=true,abstract=heading,abstract=notoc]{tudscrreprt}

%\RequirePackage{selinput}\SelectInputMappings{adieresis={ä},germandbls={ß}}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage{isodate}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{stmaryrd}
\RequirePackage{enumitem}
\RequirePackage{xspace}
\RequirePackage{ifthen}
\RequirePackage{verbatim}
\RequirePackage[all=normal,indent,floats,wordspacing,leading,charwidths,tracking,paragraphs]{savetrees}
\RequirePackage{mathtools}
\RequirePackage{etoolbox}
\RequirePackage{mathpazo}
\RequirePackage{environ}
\RequirePackage{scalerel}
\RequirePackage{multicol}
\RequirePackage{xparse}

\linespread{1.2}
% \def\arraystretch{1.3}

\newif\if@german
\@germanfalse
\DeclareOption{german}{\@germantrue}

\ProcessOptions\relax

\RequirePackage{csquotes}
\RequirePackage[
  backend=biber,
  % backend=bibtex,
  style=numeric-comp,
  doi=false,
  url=true,
  isbn=false,
  mincrossrefs=99
]{biblatex}

\RequirePackage{amsthm}
\RequirePackage{varioref}
\RequirePackage{hyperref}
  \hypersetup{pdfprintscaling=None}
\RequirePackage{cleveref}

% Definitio   Definitiones
% Lemma       Lemmata
% Propositio  Propositiones
% Theorema    Theoremata
% Corollarium Corollaria
% Approbatio  Approbationes

\newtheoremstyle{plain}
  {\topsep}   % ABOVESPACE
  {\topsep}   % BELOWSPACE
  {}          % BODYFONT
  {}          % INDENT (empty value is the same as 0pt)
  {\bfseries\color{cddarkblue}} % HEADFONT
  {}          % HEADPUNCT
  {1em}%{5pt plus 1pt minus 1pt} % HEADSPACE
  {}          % CUSTOM-HEAD-SPEC

\theoremstyle{plain}

\newtheorem{definition}{Definitio}
\newtheorem*{definition*}{Definitio}
\crefformat{definition}{Definitio~#2#1#3}
\Crefformat{definition}{Definitio~#2#1#3}
\crefmultiformat{definition}{Definitiones~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{definition}{Definitiones~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheorem{lemma}[definition]{Lemma}
\newtheorem*{lemma*}{Lemma}
\crefformat{lemma}{Lemma~#2#1#3}
\Crefformat{lemma}{Lemma~#2#1#3}
\crefmultiformat{lemma}{Lemmata~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{lemma}{Lemmata~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheorem{proposition}[definition]{Propositio}
\newtheorem*{proposition*}{Propositio}
\crefformat{proposition}{Propositio~#2#1#3}
\Crefformat{proposition}{Propositio~#2#1#3}
\crefmultiformat{proposition}{Propositiones~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{proposition}{Propositiones~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheorem{theorem}[definition]{Theorem}
\newtheorem*{theorem*}{Theorem}
\crefformat{theorem}{Theorema~#2#1#3}
\Crefformat{theorem}{Theorema~#2#1#3}
\crefmultiformat{theorem}{Theoremata~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{theorem}{Theoremata~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheorem{corollary}[definition]{Corollarium}
\newtheorem*{corollary*}{Corollarium}
\crefformat{corollary}{Corollarium~#2#1#3}
\Crefformat{corollary}{Corollarium~#2#1#3}
\crefmultiformat{corollary}{Corollaria~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{corollary}{Corollaria~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheorem{claim}[definition]{Claim}
\newtheorem*{claim*}{Claim}
\crefformat{claim}{Claim~#2#1#3}
\Crefformat{claim}{Claim~#2#1#3}
\crefmultiformat{claim}{Claims~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefmultiformat{claim}{Claims~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\newtheoremstyle{proof}
  {\topsep}   % ABOVESPACE
  {\topsep}   % BELOWSPACE
  {}          % BODYFONT
  {}          % INDENT (empty value is the same as 0pt)
  {\bfseries\color{cddarkblue}} % HEADFONT
  {}          % HEADPUNCT
  {1em}%{5pt plus 1pt minus 1pt} % HEADSPACE
  {\thmname{#1#3}}          % CUSTOM-HEAD-SPEC

\theoremstyle{proof}

\newtheorem*{proof*}{\proofname}
\renewenvironment{proof}[1][]{
  \if\relax\detokenize{#1}\relax%
    \begin{proof*}%
  \else%
    \begin{proof*}[~#1]%
  \fi%
  \pushQED{\qed}%
}{
  \popQED%
  \end{proof*}%
}

\addto\captionsenglish{\renewcommand{\proofname}{Approbatio}}

\newtheoremstyle{noparensnamed}
  {\topsep}
  {\topsep}
  {}
  {}
  {\bfseries\color{cddarkblue}}
  {}
  {1em}%{5pt plus 1pt minus 1pt}%{.5em}
  {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}}
\theoremstyle{noparensnamed}
\newtheorem{citetheorem}[definition]{Theorem}

\newtheoremstyle{noparens}
  {\topsep}
  {\topsep}
  {}
  {}
  {\bfseries\color{cddarkblue}}
  {}
  {1em}%{5pt plus 1pt minus 1pt}%{.5em}
  {\thmnote{#3}}%{\thmname{#1}\thmnumber{ #2}\thmnote{ #3}}
\theoremstyle{noparens}
\newtheorem*{citation*}{Citation}

\Crefformat{enumi}{Statement~#2#1#3}
\Crefrangeformat{enumi}{Statements~#3#1#4 to~#5#2#6}
\Crefmultiformat{enumi}{Statements~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}
\Crefrangemultiformat{enumi}{Statements~#2#1#3}{ and~#2#1#3}{, #2#1#3}{, and~#2#1#3}

\if@german
  \PassOptionsToClass{ngerman}{tudscrreprt}
  \PassOptionsToPackage{ngerman}{babel}
  \PassOptionsToPackage{ngerman}{isodate}
  \faculty{Fakultät Informatik}
  \institute{Institut für Theoretische Informatik}
  \chair{Lehrstuhl für Automatentheorie}
\else
  \PassOptionsToClass{english}{tudscrreprt}
  \PassOptionsToPackage{english}{babel}
  \PassOptionsToPackage{english}{isodate}
  \faculty{Faculty of Computer Science}
  \institute{Institute of Theoretical Computer Science}
  \chair{Chair of Automata Theory}
\fi

\AtBeginDocument{
  \makeatletter
    \hypersetup{%
      pdftitle={\@title},%
      pdfauthor={\@author},%
      pdfkeywords={\@keywords}}%
  \makeatother
}

\AfterEndPreamble{
  \maketitle
  \if\@abstract\@empty\relax\else
    \makeatletter
      \begin{abstract@tudscr}
        \@abstract
      \end{abstract@tudscr}
    \makeatother
  \fi
  \tableofcontents
}

\newcommand{\extendedversionof}[1]{\publishers{\normalsize This is an extended version of the following article:\\\textnormal{\fullcite{#1}}}}

\makeatletter
  \let\abstract@tudscr\abstract
  \let\abstract\undefined
  \def\@abstract{\@empty}
  \newcommand{\abstract}[1]{%
    \def\@abstract{#1}%
  }
  \def\@keywords{\@empty}
  \newcommand{\keywords}[1]{%
    \def\@keywords{#1}%
  }
  \newcommand{\keywords@spacing}{\hskip 1.5mm plus 1mm minus 0.5mm \relax}
  \newcommand{\keywords@parse}[2][\keywords@spacing$\cdot$\keywords@spacing]{%
    \def\keywords@next{\def\keywords@next{\nobreak#1}}%
    \@for\keywords@this:=#2\do{\keywords@next\ignorespaces\keywords@this\ignorespaces}%
    % \@for\keywords@this:=#2\do{\keywords@next{\nobreak\ignorespaces\keywords@this\ignorespaces}}%
  }
  \AtEndEnvironment{abstract@tudscr}{%
    \if\@keywords\@empty\relax\else%
      \par\bigskip\noindent\textbf{Keywords}\quad\keywords@parse\@keywords%
    \fi%
  }
\makeatother

\pdfstringdefDisableCommands{
  \def\authormore#1{}
  \def\thanks#1{}
  \def\and{, }
}
\newcommand{\detokenizeforpdf}[1]{\texorpdfstring{#1}{\detokenize{#1}}}
