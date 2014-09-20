%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a modified class for LaTeX2e for formatting a report.
% The page layout is set using the geometry package.  
% The double/singlespacing is setup using setspace.  
% Figure captions are set using the hang option of caption2.  
% natbib is used to do the citation using an author-year format. 
% iitm.bst file formats the references as per the IITM guidelines.
%
% To use this class do the following:
%  \documentclass{iitm_course_report} 
% 
% Notes:
%   * This class will assume a4paper with 12pt fonts.
%
% This is a modified version of thesis dissertation format
% created by Prabhu Ramachandran (March 2005).
% Modified by Murthy Haradanahalli (mhsn@ae.iit.ac.in)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{iitm_course_report}[2005/03/09 Class for IIT-Madras Dissertations]

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
    \LoadClass[12pt,a4paper]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
%Changed by Murthy on 07/07/2011
\RequirePackage[a4paper,left=1.25in,right=1in,top=1in,bottom=0.67in, twoside,nohead]{geometry}
% \setlength{\topmargin}{0in}
% \setlength{\headheight}{0in}
% \setlength{\headsep}{0in}
% \setlength{\textheight}{10in}
% \setlength{\textwidth}{5.77in}
%  \setlength{\oddsidemargin}{0.25in}
%  \setlength{\evensidemargin}{0.25in}
% \setlength{\parindent}{0.5in}
% \setlength{\parskip}{36pt}
\parskip 8pt

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace} 
%\RequirePackage{atbeginend} % used to redefine the list environs
\setstretch{1.5}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
\RequirePackage[hang]{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
% natbib allows easy switching of citation style and using it along
% with the iitm.bst makes things perfect.
\RequirePackage[authoryear,round]{natbib} 
\bibliographystyle{iitm}
\newcommand{\bibstyle@iitm}{\bibpunct{(}{)}{;}{a}{,}{,}%
     \gdef\NAT@biblabel##1{##1. }}

\setlength{\bibhang}{0pt}
\citestyle{iitm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from newdiss.cls
% \department{department name} -- user macro to declare name of department.
% \coursename{course name} -- user macro to declare name of course.
\def\department#1{\gdef\@department{#1}}
\def\coursename#1{\gdef\@coursename{#1}}

%\RequirePackage[dvips]{graphicx}
\RequirePackage {graphicx}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The title page
\def\maketitle{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
    {\Large \bf \expandafter{\@title} \par}%
    \vskip 10ex%
    {\normalsize
           {\em A Report }\par
           \vskip 5ex%
           {\normalsize \em submitted by \par}
           \vskip 5ex%
           {\bf \large\MakeUppercase{\@author}\par\par}
           \vskip 5ex%
	   {\em as part of the course }\par
	   \vskip 5ex%
           {\bf \@coursename\par}
    }
  \end{center}%

  \vspace*{0.75in}
  \centerline{\includegraphics{iitm.eps}}
  \vspace*{-0.15in}
  \begin{center}
    {\bf \large DEPARTMENT OF \@department\par}
    {\bf \large INDIAN INSTITUTE OF TECHNOLOGY MADRAS, CHENNAI}
    \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}

\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

   % CERTIFICATE
   %
   \def\certificate{%% A preliminary chapter
     \clearpage
     \vspace*{36pt}
     \centerline{\Large \bf DECLARATION}
     \vskip 25pt
     \thispagestyle{empty}
     \typeout{Certificate}
 %    \setcounter{page}{0}
   }

   % ACKNOWLEDGEMENTS
   %
   \def\acknowledgements{\chapter*{\centerline{ACKNOWLEDGEMENTS}}
     \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
     \setcounter{page}{1}
   }

   % ABSTRACT
   % 
   \def\abstract{\chapter*{\centerline{ABSTRACT OF THE PROJECT}}
   \addcontentsline{toc}{chapter}{ABSTRACT OF THE PROJECT}
   }

   % ABBREVIATIONS AND NOTATIONS
   %
   \def\abbreviations{\chapter*{\centerline{ABBREVIATIONS AND NOTATIONS}}
   \addcontentsline{toc}{chapter}{ABBREVIATIONS AND NOTATIONS}
   }

   % Makes the chapter heading
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
       \begin{center}
         \Large\bfseries \@chapapp\space \thechapter
       \end{center}
       \par\nobreak
       \vskip 20\p@
       \fi
       \interlinepenalty\@M
       \Large \bf
       \begin{center}
         #1\par\nobreak      
       \end{center}
       \vskip 20\p@
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* commands
   \def\@makeschapterhead#1{%
     \vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \Large \bfseries #1\par\nobreak
       \vskip 20\p@
     }}

\def\appendix{\chapter*{\centerline{APPENDIX}}
\addcontentsline{toc}{chapter}{APPENDIX}
 }

           \normalbaselines
   
   % CV
   \def\CV{\chapter*{\centerline{CURRICULUM VITAE}}}

   % Comittee


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Renewed commands to set the titles of various pages correctly.
   \renewcommand\contentsname{\centering TABLE OF CONTENTS}
   \renewcommand\listfigurename{\centering LIST OF FIGURES}
   \renewcommand\listtablename{\centering LIST OF TABLES}
   \renewcommand{\chaptername}{CHAPTER}
   \renewcommand\bibname{\centering REFERENCES}
   \renewcommand\appendixname{APPENDIX}

\renewcommand{\section}{\@startsection
{section}%                   % the name
{1}%                         % the level
{0mm}%                       % the indent
{-\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\normalfont\bf\MakeUppercase}} % the style
\renewcommand{\subsection}{\@startsection
{subsection}%                   % the name
{2}%                         % the level
{0mm}%                       % the indent
{-\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\normalfont\bf}} % the style

