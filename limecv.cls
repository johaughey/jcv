%%
%% This is file `limecv.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% limecv.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{limecv}
    [2017/09/12 v0.1.3 limecv Document class for CVs.]

% Don't hypenate words
\usepackage[none]{hyphenat}

\RequirePackage{kvoptions}
\DeclareBoolOption[false]{print}
\newif\ifcv@fontPath
\cv@fontPathfalse
\DeclareStringOption{path}
\AddToKeyvalOption*{path}{\cv@fontPathtrue}
\DeclareStringOption[Fira Sans]{sansfont}
\DeclareStringOption[Fira Mono]{monofont}
\ProcessKeyvalOptions*
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}
\RequirePackage{xparse}
\RequirePackage{calc}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{parskip}
\RequirePackage{xstring}
\RequirePackage{xkeyval}
\definecolor{cvGreen}{HTML}{357F2D}
\definecolor{cvGreenLight}{HTML}{b8e4b3}
\definecolor{cvRed}{HTML}{7f2d35}
\definecolor{cvDark}{HTML}{2F3142}
\definecolor{cvAccent}{HTML}{474A65}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\%
\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\%
\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\%
\arraybackslash\hspace{0pt}}m{#1}}
\NewDocumentCommand{\cvComma}{}{,}
\ExplSyntaxOn
\DeclareExpandableDocumentCommand{\@IfNoValueOrEmptyTF}%
  {mmm}{\IfNoValueTF{#1}{#2}{
    \tl_if_empty:nTF {#1} {#2} {#3}%
   }
}
\ExplSyntaxOff
\long\def\ifnodedefined#1#2#3{%
  \@ifundefined{pgf@sh@ns@#1}{#3}{#2}%
}
\NewDocumentCommand{\globalcolor}{m}{%
  \color{#1}\global\let\default@color\current@color
}
\AtBeginDocument{\globalcolor{cvDark}}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\usetikzlibrary{%
  calc,
  positioning,
  fit,
  arrows.meta,
  backgrounds,
  matrix}
\tikzset{
  interesticon/.style = {},
  interesttext/.style = {},
  eventdottext/.style = {},
  invisibletimedot/.style = {},
  timedot/.style = {},
  contactIcon/.style={},
  contactText/.style={},
  headerIcon/.style={},
  skillLevel/.style={},
  languageText/.style={},
  skillText/.style={},
  progressArea/.style={},
  progressBar/.style={},
  sectionTitle/.style={},
  sectionEduText/.style={%
  eventdottext,
  anchor=north west
  },
  cv@interesticon/.style = {%
    minimum width=\cvHeaderIconWidth,
    interesticon
  },
  cv@interesttext/.style = {%
    interesttext,
  },
  cv@eventdottext/.style = {%
    text width=\cvMainWidth-\cvTimeDotSep,
    black,
    anchor=north west,
    eventdottext,
  },
  cv@invisibletimedot/.style = {%
    circle,
    minimum width=\cvTimeDotDiameter,
    anchor=center,
    invisibletimedot,
  },
  cv@timedot/.style = {%
    cv@invisibletimedot,
    draw,
    fill,
    black,
    timedot,
  },
  cv@contactIcon/.style={%
    minimum height=\baselineskip,
    contactIcon,
  },
  cv@contactText/.style={%
    minimum height=\baselineskip,
    text depth=0pt,
    contactText,
  },
  cv@headerIcon/.style={%
    minimum width=\cvHeaderIconWidth,
    anchor=center,
    headerIcon,
  },
  cv@skillLevel/.style={skillLevel,},
  cv@languageText/.style={languageText,},
  cv@skillText/.style={skillText,},
  cv@progressArea/.style={%
    minimum width=\cvProgressAreaWidth,
    minimum height=\cvProgressAreaHeight,
    rectangle,
    draw,
    cvGreen,
    progressArea
  },
  cv@progressBar/.style={%
    minimum height=\cvProgressAreaHeight,
    rectangle,
    draw,
    fill,
    cvGreen,
    anchor=west,
    progressBar
  },
  cv@sectionTitle/.style={%
    anchor=north west,
    align=left,
    sectionTitle,
  },
  cv@sectionEduText/.style={%
    cv@eventdottext,
    anchor=north west,
    sectionEduText,
  },
}
\NewDocumentCommand{\cv@loadFonts}{}{
  \RequirePackage{fontspec}
  \RequirePackage{fontawesome}
  \setmainfont[Numbers={Monospaced}]{\limecv@sansfont}
  \setsansfont{\limecv@sansfont}
  \setmonofont{\limecv@monofont}
  \ifcv@fontPath
    \newfontfamily{\cv@FA}[Path=\limecv@path]%
      {FontAwesome}
  \else
    \newfontfamily{\cv@FA}{FontAwesome}
  \fi
  \ProvideDocumentCommand{\faAddressCard}{}{{\cv@FA%
    \symbol{"F2B9}}}
  \ProvideDocumentCommand{\faVcard}{}{{\cv@FA%
    \symbol{"F2BB}}}
  \ProvideDocumentCommand{\faMicrochip}{}{{\cv@FA%
    \symbol{"F2DB}}}
}
\ifxetex
  \cv@loadFonts
\else
  \ifluatex
    \cv@loadFonts
  \else
    \RequirePackage{fontawesome}
    \RenewDocumentCommand{\familydefault}{}{\sfdefault}
  \fi
\fi
\ifxetex
  \NewDocumentCommand{\kright}{m}{\leavevmode #1%
    \kern-\XeTeXglyphbounds3 \the\XeTeXcharglyph`#1 }
  \NewDocumentCommand{\kleft}{m}{\leavevmode %
    \kern-\XeTeXglyphbounds1 \the\XeTeXcharglyph`#1 #1}
\else
  \NewDocumentCommand{\kright}{m}{#1}
  \NewDocumentCommand{\kleft}{m}{#1}
\fi
\ExplSyntaxOn
\cs_generate_variant:Nn\tl_item:nn {f}
\DeclareExpandableDocumentCommand{\extract}{mm}{%
  \tl_item:fn{#1}{#2}%
}
\ExplSyntaxOff
%% \pagenumbering{gobble}
\pagestyle{empty}
\newlength\cvColSep
\setlength\cvColSep{0.8cm} % 2 times column separation!
\newlength\cvNodeSep
\setlength\cvNodeSep{0.3cm}
\newlength\cvTimeDotDiameter
\setlength\cvTimeDotDiameter{3pt}
\newlength\cvMargin
\setlength\cvMargin{0.7cm}
\newlength\cvSideWidth
\setlength\cvSideWidth{0.25\paperwidth-\cvMargin}
\newlength\cvMainWidth
\setlength\cvMainWidth{\paperwidth-4\cvMargin-\cvSideWidth}
\newlength\cvTimeDotSep
\setlength\cvTimeDotSep{0.4cm}
\newlength\cvStartEndSep
\setlength\cvStartEndSep{0.5cm}
\newlength\cvItemSep
\setlength\cvItemSep{0.4cm}
\newlength\cvTableSepWidth
\setlength\cvTableSepWidth{0.3cm}
\newlength\cvCoverLetterHeight
\setlength\cvCoverLetterHeight{\cvSideWidth}
\newlength\cvCoverLetterWidth
\setlength\cvCoverLetterWidth{\cvMainWidth+3\cvMargin}
\newlength\cvPictureWidth
\setlength\cvPictureWidth{4cm}
\newlength\cvProgressAreaWidth
\setlength\cvProgressAreaWidth{5em}
\newlength\cvProgressAreaHeight
\setlength\cvProgressAreaHeight{0.75em}
\newlength\cvSectionSep
\setlength\cvSectionSep{0.6cm}
\newlength\cvSectionSBSep
\setlength\cvSectionSBSep{7pt}
\newlength\cvTitleLineWidth
\setlength\cvTitleLineWidth{2pt}
\newlength\cvTitleLineSpacing
\setlength\cvTitleLineSpacing{0.1cm}
\newlength\cv@projectSep
\setlength\cv@projectSep{0cm}
\newlength\cvProjectDetailsSep
\setlength\cvProjectDetailsSep{0.2cm}
\newlength\cvInterestDetailsSep
\setlength\cvInterestDetailsSep{1pt}
\newlength\cvContactItemSep
\setlength\cvContactItemSep{5pt}
\newlength\cvCoverLetterLineWidth
\setlength\cvCoverLetterLineWidth{3pt}
\newlength\cvCoverLetterPositionSpacing
\setlength\cvCoverLetterPositionSpacing{10pt}
\newlength\cvSBSectionLineWidth
\setlength\cvSBSectionLineWidth{1pt}
\newlength\cvCoverLetterLineSpacing
\setlength\cvCoverLetterLineSpacing{0pt}
\newlength\cvIDNameSep
\setlength\cvIDNameSep{0.1cm}
\newlength\cvPositionSep
\setlength\cvPositionSep{0.2cm}
\newlength\cvSkillSep
\setlength\cvSkillSep{1ex}
\newlength\cvHeaderIconWidth
\setlength\cvHeaderIconWidth{0pt}
\NewDocumentCommand{\cvSection}{m}{\Large\textbf{#1}}
\newcount\my@repeat@count
\NewDocumentCommand{\cvSkill}{m}{%
  \begingroup
  \my@repeat@count=\z@
  \@whilenum\my@repeat@count<#1\do{\faCircle\advance%
    \my@repeat@count\@ne}%
  \my@repeat@count=\numexpr5-\z@\relax
  \@whilenum\my@repeat@count>#1\do{\faCircleO\advance%
    \my@repeat@count\m@ne}%
  \endgroup
}
\NewDocumentCommand{\cvhrulefill}{}{{\color{cvGreen}%
\leavevmode\leaders\hrule height \cvSBSectionLineWidth\hfill\kern\z@}}
\NewDocumentCommand{\ruleline}{m}{\par\noindent\raisebox{.6ex}{%
\makebox[\linewidth]{\cvhrulefill\hspace{1ex}%
\raisebox{-.6ex}{#1}\hspace{1ex}\cvhrulefill}}}
\newcounter{cv@titlePrev}
\setcounter{cv@titlePrev}{0}
\newcounter{cv@titleNext}
\setcounter{cv@titleNext}{1}
\NewDocumentCommand{\cv@Title}{mm}{%
  \ifnodedefined{cv@last item \the\value{cv@lastItem}}{%
    \setlength\cvHeaderIconWidth{\maxof{\cvHeaderIconWidth}{\widthof{\Large #2}}}%
    \protected@write\@auxout{}{\global\cvHeaderIconWidth=\the\cvHeaderIconWidth}
    \node[%
      below=\cvSectionSep of cv@last item %
        \the\value{cv@lastItem}.south west,
      cv@sectionTitle]
      (cv@title \the\value{cv@titleNext})
      {\begingroup\edef\y{\endgroup%
      \cvSection\bgroup\noexpand\kleft{%
        \extract{#1}{1}}}%
      \y\StrGobbleLeft{#1}{1}\egroup};
    \node[%
      left=\cvTimeDotSep of cv@title \the\value{cv@titleNext},
      cv@headerIcon]
      {#2};
    \node[
      below=\cvSectionSep of cv@last item %
        \the\value{cv@lastItem}.south west,
      cv@sectionTitle]
      (cv@title \the\value{cv@titleNext} dummy) {%
        \phantom{\cvSection{Education}}};
    \begin{scope}[on background layer]
      \draw[line width=\cvTitleLineWidth,cvGreen]
        let \p1=(cv@title \the\value{cv@titleNext} %
                dummy.south west),
            \p2=(current page.east) in
        (\x1,\y1-\cvTitleLineSpacing) to (\x2,\y1-\cvTitleLineSpacing);
    \end{scope}
  }{%
    \node[cv@sectionTitle] at (0,0) (cv@title %
      \the\value{cv@titleNext})
    {\begingroup\edef\y{\endgroup%
    \cvSection\bgroup\noexpand\kleft{\extract{#1}{1}}}%
    \y\StrGobbleLeft{#1}{1}\egroup};
    \node[%
      left=\cvTimeDotSep of cv@title \the\value{cv@titleNext},
      cv@headerIcon]
      {#2};
    \node[cv@sectionTitle] at (0,0)
      (cv@title \the\value{cv@titleNext} dummy) {%
        \phantom{\cvSection{Education}}};
    \begin{scope}[on background layer]
      \draw[line width=\cvTitleLineWidth,cvGreen]
        let \p1=(cv@title \the\value{cv@titleNext} %
                dummy.south west),
            \p2=(current page.east) in
        (\x1,\y1-\cvTitleLineSpacing) to (\x2,\y1-\cvTitleLineSpacing);
    \end{scope}
}%
\stepcounter{cv@titlePrev}%
\stepcounter{cv@titleNext}
}
\NewDocumentCommand{\cv@EndSectionDraw}{}{
  \draw (start) to (end.center);}
\newcounter{cv@itemPrev}
\setcounter{cv@itemPrev}{0}
\newcounter{cv@itemNext}
\setcounter{cv@itemNext}{1}
\newcounter{cv@lastItem}
\setcounter{cv@lastItem}{1}
\NewDocumentCommand{\cv@definecvItem}{}{
  \NewDocumentCommand{\cvItem}{m}{%
    \ifnodedefined{item \the\value{cv@itemPrev}}{%
      \node[%
        below=\cvItemSep of item %
          \the\value{cv@itemPrev}.south west,
        cv@eventdottext]
        (item \the\value{cv@itemNext} header)
        {\phantom{Evening}};
      \node[%
        below=\cvItemSep of item %
          \the\value{cv@itemPrev}.south west,
        cv@sectionEduText]
        (item \the\value{cv@itemNext})
        {##1};
      \node[%
        left=\cvTimeDotSep of item %
          \the\value{cv@itemNext} header,
        cv@timedot]
        {};
    }{
      \node[%
        below=\cvItemSep of cv@title %
          \the\value{cv@titlePrev}.south west,
        cv@eventdottext]
        (item \the\value{cv@itemNext} header)
        {\phantom{Evening}};
      \node[
        below=\cvItemSep of cv@title %
          \the\value{cv@titlePrev}.south west,
        cv@sectionEduText]
        (item \the\value{cv@itemNext})
        {##1};
      \node[
        left=\cvTimeDotSep of item %
          \the\value{cv@itemNext} header,
        cv@timedot]
        (start)
        {};
    }
    \node[
      left=\cvTimeDotSep of item %
        \the\value{cv@itemNext}.south west,
      cv@invisibletimedot]
      (end)
      {};
    \stepcounter{cv@itemPrev}
    \stepcounter{cv@itemNext}
  }
}
\NewDocumentCommand{\cv@definecvItemTwo}{}{
  \NewDocumentCommand{\cvItemTwo}{m}{%
    \ifnodedefined{item \the\value{cv@itemPrev}}{%
      \node[%
        below=\cvItemSep of item %
          \the\value{cv@itemPrev}.south west,
        cv@eventdottext]
        (item \the\value{cv@itemNext} header)
        {\phantom{Evening}};
      \node[%
        below=\cvItemSep of item %
          \the\value{cv@itemPrev}.south west,
        cv@sectionEduText]
        (item \the\value{cv@itemNext})
        {##1};
      \node[%
        left=\cvTimeDotSep of item %
          \the\value{cv@itemNext} header,
        cv@invisibletimedot]
        {};
    }{
      \node[%
        below=\cvItemSep of cv@title %
          \the\value{cv@titlePrev}.south west,
        cv@eventdottext]
        (item \the\value{cv@itemNext} header)
        {\phantom{Evening}};
      \node[
        below=\cvItemSep of cv@title %
          \the\value{cv@titlePrev}.south west,
        cv@sectionEduText]
        (item \the\value{cv@itemNext})
        {##1};
      \node[
        left=\cvTimeDotSep of item %
          \the\value{cv@itemNext} header,
        cv@invisibletimedot]
        (start)
        {};
    }
    \node[
      left=\cvTimeDotSep of item %
        \the\value{cv@itemNext}.south west,
      cv@invisibletimedot]
      (end)
      {};
    \stepcounter{cv@itemPrev}
    \stepcounter{cv@itemNext}
  }
}
\pgfkeys{/@cv/names/.is family,
         /@cv/names/.unknown/.style = %
         {\pgfkeyscurrentpath/\pgfkeyscurrentname/%
         .initial = #1}}
\NewDocumentCommand{\cv@setEnglish}{}{
    \pgfkeys{/@cv/names/profile = Profile}%
    \pgfkeys{/@cv/names/contact = Contact}%
    \pgfkeys{/@cv/names/languages = Languages}%
    \pgfkeys{/@cv/names/interests = Interests}%
    \pgfkeys{/@cv/names/professional = Professional}%
    \pgfkeys{/@cv/names/personal = Personal}%
    \pgfkeys{/@cv/names/projects = Projects}%
    \pgfkeys{/@cv/names/education = Education}%
    \pgfkeys{/@cv/names/experience = Experience}%
    \pgfkeys{/@cv/names/references = References}%
    \pgfkeys{/@cv/names/referencessb = References}%
    \pgfkeys{/@cv/names/skills = Skills}%
    \pgfkeys{/@cv/names/skills2 = Skills}%
    \pgfkeys{/@cv/names/skills3 = Skills}%
}
\NewDocumentCommand{\cv@setDutch}{}{
    \pgfkeys{/@cv/names/profile = Profiel}%
    \pgfkeys{/@cv/names/contact = Gegevens}%
    \pgfkeys{/@cv/names/languages = Talenkennis}%
    \pgfkeys{/@cv/names/interests = Interesses}%
    \pgfkeys{/@cv/names/professional = Professioneel}%
    \pgfkeys{/@cv/names/personal = Persoonlijk}%
    \pgfkeys{/@cv/names/projects = Projecten}%
    \pgfkeys{/@cv/names/education = Opleiding}%
    \pgfkeys{/@cv/names/experience = Werkervaring}%
    \pgfkeys{/@cv/names/references = Referenties}%
    \pgfkeys{/@cv/names/referencessb = Referenties}%
    \pgfkeys{/@cv/names/skills = Vaardigheden}%
    \pgfkeys{/@cv/names/skills2 = Vaardigheden}%
    \pgfkeys{/@cv/names/skills3 = Vaardigheden}%

}
\ExplSyntaxOn
\NewDocumentCommand{\cvSetLanguage}{m}{
    \str_case:nnF {#1}
    {
      {dutch} {\cv@setDutch}
      {english} {\cv@setEnglish}
    }
    {\ClassError{limecv}{Unknown option `#1' for cvLanguage %
     macro.}{Only `english' and `dutch' are valid options %
     for this macro.}}
}
\ExplSyntaxOff
\cvSetLanguage{english}
\newif\ifcv@firstskill
\NewDocumentCommand{\cv@skillsTable}{}{}
\NewDocumentCommand{\cvSkillTwo}{mmmm}{%
  \ifcv@firstskill
    \g@addto@macro\cv@skillsTable{\cvSkill{#1} %
      & #2 & \cvSkill{#3} & #4}
    \cv@firstskillfalse
  \else
    \g@addto@macro\cv@skillsTable{\\[\cvSkillSep] \cvSkill{#1} %
      & #2 & \cvSkill{#3} & #4}
  \fi
}
\NewDocumentCommand{\cvSkillOne}{mm}{%
  \ifcv@firstskill
    \g@addto@macro\cv@skillsTable{\cvSkill{#1} & #2}
    \cv@firstskillfalse
  \else
    \g@addto@macro\cv@skillsTable{\\[\cvSkillSep] \cvSkill{#1} & #2}
  \fi
}
\NewDocumentEnvironment{cvMainContent}{}{%
  \begin{tikzpicture}[%
    every node/.style={%
      inner sep=0pt,
      outer sep=0pt},
    remember picture,
    overlay,
    shift={($(current page.north west)+%
      (\cvSideWidth+3\cvMargin+\cvTimeDotSep,-\cvMargin)$)}]
}{%
  \end{tikzpicture}
}
\NewDocumentEnvironment{cvMainContent*}{}{%
  \stepcounter{titlePrev}
  \stepcounter{titleNext}
    \begin{tikzpicture}[%
      every node/.style={
        inner sep=0pt,
        outer sep=0pt},
      remember picture,
      overlay,
      shift={($(current page.north west)+%
      (\cvMargin+\cvTimeDotSep,-\cvMargin)$)}]
}{%
    \end{tikzpicture}%
}
\NewDocumentEnvironment{cvEducation}{}{%
    \cv@Title{\pgfkeysvalueof{/@cv/names/education}}{\faGraduationCap}
    \stepcounter{cv@itemPrev}
    \stepcounter{cv@itemNext}
    \cv@definecvItem
  }{%
    \cv@EndSectionDraw
    \stepcounter{cv@lastItem}
    \draw (item \the\value{cv@itemPrev}.south west)
      node (cv@last item \the\value{cv@lastItem}) {};
}
\NewDocumentEnvironment{cvExperience}{}{%
  \cv@Title{\pgfkeysvalueof{/@cv/names/experience}}{\faBriefcase}
  \stepcounter{cv@itemPrev}
  \stepcounter{cv@itemNext}
  \cv@definecvItem
}{%
  \cv@EndSectionDraw
  \stepcounter{cv@lastItem}
  \draw (item \the\value{cv@itemPrev}.south west)
    node (cv@last item \the\value{cv@lastItem}) {};
}
\NewDocumentEnvironment{cvSkills}{}{%
  \cv@Title{\pgfkeysvalueof{/@cv/names/skills}}{\faStar}
  \global\cv@firstskilltrue
}{%
  \node[
    below=\cvSectionSep of cv@title \the\value{cv@titlePrev}%
      .south west,
    anchor=north west] (skills) %
    {\begin{tabular}{@{}ll@{\hskip\cvColSep}ll@{}}%
    \cv@skillsTable
    \end{tabular}};
  \stepcounter{cv@lastItem}
  \draw (skills.south west) node %
    (cv@last item \the\value{cv@lastItem}) {};
}
\NewDocumentEnvironment{cvReferences}{}{%
  \cv@Title{\pgfkeysvalueof{/@cv/names/references}}{\faLink}
  \node[
    below=\cvSectionSep of cv@title \the\value{cv@titlePrev}.%
      south west,
    anchor=north west,
    ] (cv@References) \bgroup %
}{%
  \egroup;
  \stepcounter{cv@lastItem}
  \draw (cv@References.south west) node %
    (cv@last item \the\value{cv@lastItem}) {};
}
\pgfkeys{/@cv/references/.is family,
         /@cv/references/.unknown/.style = %
         {\pgfkeyscurrentpath/\pgfkeyscurrentname/%
         .initial = #1}}
\newif\ifcv@refName
\pgfkeys{/@cv/references/name/.is if=cv@refName}
\pgfkeys{/@cv/references/name=false}
\newif\ifcv@refPosition
\pgfkeys{/@cv/references/position/.is if=cv@refPosition}
\pgfkeys{/@cv/references/position=false}
\newif\ifcv@refCompany
\pgfkeys{/@cv/references/company/.is if=cv@refCompany}
\pgfkeys{/@cv/references/copmany=false}
\newif\ifcv@refAddressLineA
\pgfkeys{/@cv/references/address line 1/.is if=%
  cv@refAddressLineA}
\pgfkeys{/@cv/references/address line 1=false}
  \newif\ifcv@refAddressLineB
\pgfkeys{/@cv/references/address line 2/.is if=%
  cv@refAddressLineB}
\pgfkeys{/@cv/references/address line 2=false}
\newif\ifcv@refAddressLineC
\pgfkeys{/@cv/references/address line 3/.is if=%
  cv@refAddressLineC}
\pgfkeys{/@cv/references/address line 3=false}
\newif\ifcv@refWorkPhone
\pgfkeys{/@cv/references/work phone/.is if=%
  cv@refWorkPhone}
\pgfkeys{/@cv/references/work phone=false}
\newif\ifcv@refMobilePhone
\pgfkeys{/@cv/references/mobile phone/.is if=%
  cv@refMobilePhone}
\pgfkeys{/@cv/references/mobile phone=false}
\newif\ifcv@refStored
\pgfkeys{/@cv/references/value stored/.is if=%
  cv@refStored}
\pgfkeys{/@cv/references/value stored=false}
\define@key{cvAddReferenceA}{name}{%
  \global\def\cv@refAName{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/name = true}}}
\define@key{cvAddReferenceA}{company}{%
  \global\def\cv@refACompany{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/company = true}}}
\define@key{cvAddReferenceA}{position}{%
  \global\def\cv@refAPosition{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/position = true}}}
\define@key{cvAddReferenceA}{address line 1}{%
  \global\def\cv@refAAddressLineA{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 1 = true}}}
\define@key{cvAddReferenceA}{address line 2}{%
  \global\def\cv@refAAddressLineB{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 2 = true}}}
\define@key{cvAddReferenceA}{address line 3}{%
  \global\def\cv@refAAddressLineC{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 3 = true}}}
\define@key{cvAddReferenceA}{phone work}{%
  \global\def\cv@refAPhoneWork{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/phone work = true}}}
\define@key{cvAddReferenceA}{mobile phone}{%
  \global\def\cv@refAMobilePhone{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/mobile phone = true}}}
\define@key{cvAddReferenceB}{name}{%
  \global\def\cv@refBName{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/name = true}}}
\define@key{cvAddReferenceB}{company}{%
  \global\def\cv@refBCompany{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/company = true}}}
\define@key{cvAddReferenceB}{position}{%
  \global\def\cv@refBPosition{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/position = true}}}
\define@key{cvAddReferenceB}{address line 1}{%
  \global\def\cv@refBAddressLineA{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 1 = true}}}
\define@key{cvAddReferenceB}{address line 2}{%
  \global\def\cv@refBAddressLineB{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 2 = true}}}
\define@key{cvAddReferenceB}{address line 3}{%
  \global\def\cv@refBAddressLineC{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/address line 3 = true}}}
\define@key{cvAddReferenceB}{phone work}{%
  \global\def\cv@refBPhoneWork{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/phone work = true}}}
\define@key{cvAddReferenceB}{mobile phone}{%
  \global\def\cv@refBMobilePhone{#1}%
  \@IfNoValueOrEmptyTF{#1}{}{\pgfkeys{/@cv/references/mobile phone = true}}}
\NewDocumentEnvironment{cvSkills2}{}{%
    \cv@Title{\pgfkeysvalueof{/@cv/names/skills2}}{\faStar}
    \stepcounter{cv@itemPrev}
    \stepcounter{cv@itemNext}
    \cv@definecvItemTwo
  }{%
}

\NewDocumentCommand{\cvAddReference}{sm}{%
  \IfBooleanTF{#1}{%
    \setkeys{cvAddReferenceA}{name=,company=,
      position=,address line 1=,address line 2=,
      address line 3=,phone work=,mobile phone=,#2}
    \pgfkeys{/@cv/references/name = true}%
  }{%
    \setkeys{cvAddReferenceB}{name=,company=,
    position=,address line 1=,address line 2=,
    address line 3=,phone work=,mobile phone=,#2}
    \ifcv@refStored%
      \begin{tabular}{@{}L{0.5\cvMainWidth-0.5\cvTimeDotSep%
            -0.5\cvTableSepWidth}@{\hskip \cvTableSepWidth}%
          L{0.5\cvMainWidth-0.5\cvTimeDotSep%
            -0.5\cvTableSepWidth}@{}}%
        \ifcv@refName            \cv@refAName         & \cv@refBName         \fi %
        \ifcv@refCompany      \\ \cv@refACompany      & \cv@refBCompany      \fi %
        \ifcv@refPosition     \\ \cv@refAPosition     & \cv@refBPosition     \fi %
        \ifcv@refAddressLineA \\ \cv@refAAddressLineA & \cv@refBAddressLineA \fi %
        \ifcv@refAddressLineB \\ \cv@refAAddressLineB & \cv@refBAddressLineB \fi %
        \ifcv@refAddressLineC \\ \cv@refAAddressLineC & \cv@refBAddressLineC \fi %
        \ifcv@refWorkPhone    \\ \cv@refAPhoneWork    & \cv@refBPhoneWork    \fi %
        \ifcv@refMobilePhone  \\ \cv@refAMobilePhone  & \cv@refBMobilePhone  \fi %
      \end{tabular}%
      \pgfkeys{/@cv/references/value stored = false}%
    \else%
      \begin{tabular}{@{}L{0.5\cvMainWidth%
          -0.5\cvTimeDotSep}@{}}%
        \ifcv@refName            \cv@refBName         \fi %
        \ifcv@refCompany      \\ \cv@refBCompany      \fi %
        \ifcv@refPosition     \\ \cv@refBPosition     \fi %
        \ifcv@refAddressLineA \\ \cv@refBAddressLineA \fi %
        \ifcv@refAddressLineB \\ \cv@refBAddressLineB \fi %
        \ifcv@refAddressLineC \\ \cv@refBAddressLineC \fi %
        \ifcv@refWorkPhone    \\ \cv@refBPhoneWork    \fi %
        \ifcv@refMobilePhone  \\ \cv@refBMobilePhone  \fi %
      \end{tabular}%
    \fi%
  }%
}
\NewDocumentEnvironment{cvSidebar}{}{%
  \vspace*{\fill}
  \vspace*{-0.5\cvMargin}
  \begin{tikzpicture}[remember picture,overlay]
    \fill[cvGreenLight] (current page.north west) rectangle %
      ++(\cvSideWidth+2\cvMargin,-\paperheight);
  \end{tikzpicture}%
  \begin{minipage}{\cvSideWidth}
    \begin{center}
}{%
    \end{center}
  \end{minipage}
  \vspace*{\fill}
}
\NewDocumentEnvironment{cvSidear*}{}{%
  \vspace*{\fill}
  \vspace*{-0.5\cvMargin}
  \begin{tikzpicture}[remember picture,overlay]
    \fill[cvGreenLight] (current page.north east) rectangle %
      ++(-\cvSideWidth-2\cvMargin,-\paperheight);
  \end{tikzpicture}%
  \begin{minipage}{\cvSideWidth}
    \begin{center}
}{%
    \end{center}
  \end{minipage}
  \vspace*{\fill}
}
\NewDocumentEnvironment{cvProfile}{}{%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/profile}}
}{%
}
\NewDocumentEnvironment{cvReferencesSB}{}{%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/referencessb}}
}{%
}
\NewDocumentCommand{\cv@ContactTemplate}{mm}{
  \NewDocumentCommand{#1}{m}{
      \ifcv@contactfirst \\ \else %
        \global\cv@contactfirsttrue \fi\node[cv@contactIcon]{#2};
        \pgfmatrixnextcell \node[cv@contactText]{##1};
  }
}
\NewDocumentCommand{\cv@ContactTemplateLink}{mm}{
  \NewDocumentCommand{#1}{mm}{
      \ifcv@contactfirst \\ \else %
        \global\cv@contactfirsttrue \fi\node[cv@contactIcon]{#2};
        \pgfmatrixnextcell \node[cv@contactText]{%
          \@IfNoValueOrEmptyTF{##1}{##2}{\href{##1}{##2}}};
  }
}
\newif\ifcv@contactfirst
\NewDocumentEnvironment{cvContact}{}{%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/contact}}%
  \vspace{\cvSectionSBSep}

  \global\cv@contactfirstfalse
  \cv@ContactTemplate{\cvContactAddress}{\faMapMarker}
  \cv@ContactTemplate{\cvContactPhone}{\faPhone}

  \cv@ContactTemplateLink{\cvContactEmail}{\faEnvelope}
  \cv@ContactTemplateLink{\cvContactWebsite}{\faGlobe}
  \cv@ContactTemplateLink{\cvContactGithub}{\faGithub}
  \cv@ContactTemplateLink{\cvContactGitlab}{\faGitlab}
  \cv@ContactTemplateLink{\cvContactLinkedin}{\faLinkedinSquare}
  \cv@ContactTemplateLink{\cvContactTwitter}{\faTwitter}
  \cv@ContactTemplateLink{\cvContactKeybase}{\faKey}
  \begin{tikzpicture}[%
    every node/.style={inner sep=0pt, outer sep=0pt}]
    \matrix [
      column 1/.style={anchor=center},
      column 2/.style={anchor=west,align=left},
      column sep=\cvContactItemSep,
      row sep=\cvContactItemSep,
      inner sep=0pt,
      outer sep=0pt] (contact) \bgroup
}{%
  \\\egroup; % \\ required, does not compile otherwise
  \end{tikzpicture}%
}
\newif\ifcv@interestLong
\cv@interestLongtrue
\newcounter{cv@cvInterestCounter}
\setcounter{cv@cvInterestCounter}{1}
\newcounter{cv@cvInterestCounterPrev}
\setcounter{cv@cvInterestCounterPrev}{0}
\newif\ifcv@interestContent
\cv@interestContentfalse
\NewDocumentCommand{\cv@TypesetTableRows}{}{}
\newif\ifcv@interesttikzopen
\cv@interesttikzopenfalse
\NewDocumentCommand{\cv@interestClose}{}{
  \ifcv@interestLong
    \ifcv@interesttikzopen
      \end{tikzpicture}
      \global\cv@interesttikzopenfalse
    \fi
  \else
    \ifcv@interestContent
      \begin{tabular}{@{}cl@{}}
        \cv@TypesetTableRows
      \end{tabular}
    \fi
  \fi
}
\NewDocumentCommand{\cv@interestOpen}{}{
  \ifcv@interestLong
    \ifcv@interesttikzopen
    \else
      \cv@interesttikzopentrue
      \begin{tikzpicture}[%
        every node/.style={inner sep=0cm,outer sep=0cm}]
    \fi
  \else
    \global\def\cv@TypesetTableRows{}
    \global\cv@interestContentfalse
  \fi
}
\NewDocumentCommand{\cv@definecv@interestSection}{}{
  \NewDocumentCommand{\cv@interestSection}{m}{%
    \cv@interestClose\\
    \ifcv@interestContent
      \vspace*{2\cvSectionSBSep}
    \fi
    {\color{cvGreen}---} ##1 {\color{cvGreen}---}\\
    \vspace*{\cvSectionSBSep}
    \cv@interestOpen
  }
}
\NewDocumentCommand{\cv@definecvInterestLong}{}{
  \NewDocumentCommand{\cvInterest}{mm}{%
    \ifcv@interestContent %
      \node[
        below=\cvItemSep of cv@interest text \the\value{cv@cvInterestCounterPrev},
        cv@interesticon]
        (cv@interest icon \the\value{cv@cvInterestCounter}) {##1};
      \node[
        below=\cvInterestDetailsSep of cv@interest icon \the\value{cv@cvInterestCounter},
        cv@interesttext]
      (cv@interest text \the\value{cv@cvInterestCounter}) {##2};
    \else
      \cv@interestOpen
      \node[cv@interesticon] (cv@interest icon \the\value{cv@cvInterestCounter}) {##1};
      \node[
        below=\cvInterestDetailsSep of cv@interest icon \the\value{cv@cvInterestCounter},
        cv@interesttext]
        (cv@interest text \the\value{cv@cvInterestCounter}) {##2};
    \fi
    \stepcounter{cv@cvInterestCounter}
    \stepcounter{cv@cvInterestCounterPrev}
    \global\cv@interestContenttrue
  }
}
\NewDocumentCommand{\cv@definecvInterestShort}{}{
  %\def\Z{\vphantom{\parbox[c]{1cm}{\Huge Something Long}}}
  \NewDocumentCommand{\cvInterest}{mm}{%
    \g@addto@macro\cv@TypesetTableRows{##1}%
    \g@addto@macro\cv@TypesetTableRows{&}%
    \g@addto@macro\cv@TypesetTableRows{##2}%
    \g@addto@macro\cv@TypesetTableRows{\\[\cvInterestDetailsSep]}%
    \global\cv@interestContenttrue
  }
}
\ExplSyntaxOn
\NewDocumentEnvironment{cvInterests}{o}{%
  \cv@interestLongtrue

  \@IfNoValueOrEmptyTF{#1}{}{%
    \str_case:nnF {#1}{
      {long}{\cv@interestLongtrue}
      {short}{\cv@interestLongfalse}
    }{\ClassError{limecv}{Unkown option `#1' for cvInterests %
      environment.}{Only `long' and `short' are valid options %
      for this environment.}}
  }

  \cv@definecv@interestSection
  \NewDocumentCommand{\cvInterestsPersonal}{}{%
    \cv@interestSection{\faUser\ \emph{Personal}}}
  \NewDocumentCommand{\cvInterestsProfessional}{}{%
    \cv@interestSection{\faBriefcase\ \emph{Professional}}}
  \ifcv@interestLong
    \cv@definecvInterestLong
  \else
    \cv@definecvInterestShort
  \fi
  %%%%%%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/interests}}%
  \vspace{\cvSectionSBSep}
}{%
  \cv@interestClose
}
\ExplSyntaxOff
\ExplSyntaxOn
\NewDocumentEnvironment{cvSkills3}{o}{%
  \cv@interestLongtrue

  \@IfNoValueOrEmptyTF{#1}{}{%
    \str_case:nnF {#1}{
      {long}{\cv@interestLongtrue}
      {short}{\cv@interestLongfalse}
    }{\ClassError{limecv}{Unkown option `#1' for cvSkills3 %
      environment.}{Only `long' and `short' are valid options %
      for this environment.}}
  }

  \cv@definecv@interestSection
  \NewDocumentCommand{\cvInterestsTechnical}{}{%
    \cv@interestSection{\emph{Technical}}}
  \NewDocumentCommand{\cvInterestsStatistical}{}{%
    \cv@interestSection{\emph{Statistical}}}
  \NewDocumentCommand{\cvInterestsProfessional}{}{%
    \cv@interestSection{\emph{Professional}}}
  \ifcv@interestLong
    \cv@definecvInterestLong
  \else
    \cv@definecvInterestShort
  \fi
  %%%%%%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/skills3}}%
  \vspace{\cvSectionSBSep}
}{%
  \cv@interestClose
}
\ExplSyntaxOff
\newif\ifcv@projectImage
\cv@projectImagefalse
\newif\ifcv@projectLink
\cv@projectLinkfalse
\newif\ifcv@projectWidth
\cv@projectWidthfalse
\newif\ifcv@projectHeight
\cv@projectHeightfalse
\newcounter{cv@projectCurrent}
\setcounter{cv@projectCurrent}{1}
\newcounter{cv@projectPrevious}
\setcounter{cv@projectPrevious}{0}
\define@key{cv@Project}{image}{%
  \global\def\cv@projectImage{#1}%
  \cv@projectImagetrue}
\define@key{cv@Project}{link}{%
  \global\def\cv@projectLink{#1}%
  \cv@projectLinktrue}
\define@key{cv@Project}{width}{%
  \global\def\cv@projectWidth{#1}%
  \cv@projectWidthtrue}
\define@key{cv@Project}{height}{%
  \global\def\cv@projectHeight{#1}%
  \cv@projectHeighttrue}
\NewDocumentCommand{\cv@definecvProject}{}{
  \NewDocumentCommand{\cvProject}{omm}{%
    \cv@projectImagefalse
    \cv@projectLinkfalse
    \cv@projectWidthfalse
    \cv@projectHeightfalse
    \@IfNoValueOrEmptyTF{##1}{}{\setkeys{cv@Project}{##1}}
    \ifnodedefined{project \the\value{cv@projectPrevious} %
      description}{}{%
      \node (project \the\value{cv@projectPrevious} %
        description) {};
    }
    \ifcv@projectImage
      \ifcv@projectWidth
        \node[below=\cv@projectSep of project %
          \the\value{cv@projectPrevious} description]
          (project \the\value{cv@projectCurrent} image)
          {\includegraphics[width=\cv@projectWidth]{\cv@projectImage}};
      \else
        \ifcv@projectHeight
          \node[below=\cv@projectSep of project %
          \the\value{cv@projectPrevious} description]
          (project \the\value{cv@projectCurrent} image)
          {\includegraphics[height=\cv@projectHeight]{\cv@projectImage}};
        \else
          \ClassError{limecv}{No width or height specified, %
          but image specified.}{Always specify the height or %
          width if an image is set.}
        \fi
      \fi
      \node[%
        text width=\cvSideWidth,
        align=center,
        below=\cvProjectDetailsSep of project \the\value{cv@projectCurrent} image]
        (project \the\value{cv@projectCurrent} title) {%
      \ifcv@projectLink \href{\cv@projectLink}{##2} \else ##2 \fi };
    \else
      \node[below=\cv@projectSep of project %
        \the\value{cv@projectPrevious} description,
        text width=\cvSideWidth,
        align=center]
        (project \the\value{cv@projectCurrent} title) {%
      \ifcv@projectLink \href{\cv@projectLink}{##2} \else ##2 \fi };
    \fi
    \node[
      below=\cvProjectDetailsSep of project \the\value{cv@projectCurrent} title,
      text width=\cvSideWidth,
      align=center]
      (project \the\value{cv@projectCurrent} description) {##3};

    \setlength\cv@projectSep\cvItemSep
    \stepcounter{cv@projectCurrent}
    \stepcounter{cv@projectPrevious}
  }
}
\NewDocumentEnvironment{cvProjects}{}{%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/projects}}%
  \vspace{\cvSectionSBSep}
  \cv@definecvProject
  \begin{tikzpicture}[every node/.style={inner sep=0cm,outer sep=0cm}]
}{
  \end{tikzpicture}
}
\newcounter{cv@languages}
\setcounter{cv@languages}{1}
\pgfkeys{/@cv/languages/.is family,
/@cv/languages/.unknown/.style = {%
  \pgfkeyscurrentpath/\pgfkeyscurrentname/.initial = #1}}
\NewDocumentEnvironment{cvLanguages}{}{%
  \NewDocumentCommand{\cvLanguage}{mm}{%
    {\globaldefs=1\relax\pgfkeys{%
      /@cv/languages/lang\the\value{cv@languages} = ##2}}
    \node[cv@languageText]{##1}; \pgfmatrixnextcell %
      \node[cv@progressArea] (cv@language \the\value{cv@languages}) {}; \\
    \stepcounter{cv@languages}
  }%
  \vspace{\cvSectionSBSep}
  \ruleline{\pgfkeysvalueof{/@cv/names/languages}}%
  \vspace{\cvSectionSBSep}
  \begin{tikzpicture}[%
    every node/.style={text depth=0pt,inner sep=0pt,outer sep=0pt}]
  \matrix [
    column 1/.style={anchor=east},
    column sep=1.5\cvSectionSBSep,
    row sep=1.5\cvSectionSBSep,
    column 2/.style={anchor=west,align=left}
  ] (contact) \bgroup
}{%
  \\\egroup;
  \newcounter{cv@languagelevel}
  \setcounter{cv@languagelevel}{1}
  \loop\ifnum\value{cv@languagelevel}<\value{cv@languages}
    \draw (cv@language \the\value{cv@languagelevel}.west) %
      node[%
        cv@progressBar,
        minimum width=\pgfkeysvalueof{%
        /@cv/languages/lang\the\value{cv@languagelevel}}em]%
        {};
    \stepcounter{cv@languagelevel}
  \repeat
  \end{tikzpicture}
}
\define@key{cvCoverLetter}{name}{%
\global\def\cv@coverletterName{#1}}
\define@key{cvCoverLetter}{company}{%
\global\def\cv@coverletterCompany{#1}}

\define@key{cvCoverLetter}{position}{%
\global\def\cv@coverletterPosition{#1}}
\define@key{cvCoverLetter}{address line 1}{%
\global\def\cv@coverletterAddressLineA{#1}}
\define@key{cvCoverLetter}{address line 2}{%
\global\def\cv@coverletterAddressLineB{#1}}
\define@key{cvCoverLetter}{address line 3}{%
\global\def\cv@coverletterAddressLineC{#1}}
\NewDocumentCommand{\cv@definecvBeneficiary}{}{
  \NewDocumentCommand{\cvBeneficiary}{m}{%
    \setkeys{cvCoverLetter}{name={},company={},
      position={},address line 1={},address line 2={},
      address line 3={},##1}
    \begin{tabular}{@{}l}
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterName}{}{%
        \MakeUppercase{\cv@coverletterName}} %
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterCompany}{}{\\ %
        \cv@coverletterCompany} %
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterPosition}{}{\\ %
        \cv@coverletterPosition} %
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterAddressLineA}{}{\\ %
        \cv@coverletterAddressLineA} %
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterAddressLineB}{}{\\ %
        \cv@coverletterAddressLineB} %
      \@IfNoValueOrEmptyTF{%
        \cv@coverletterAddressLineC}{}{\\ %
        \cv@coverletterAddressLineC} %
    \end{tabular}%
    \vspace{\cvMargin}
  }
}
\NewDocumentCommand{\cv@definecvFullName}{}{
  \NewDocumentCommand{\cvFullName}{}{%
    \pgfkeysvalueof{/@cv/info/first name} %
    \pgfkeysvalueof{/@cv/info/last name}
  }
}
\NewDocumentEnvironment{cvCoverLetter}{}{%
  \newgeometry{textwidth=\cvCoverLetterWidth,noheadfoot}
  \begin{tikzpicture}[%
      remember picture,
      overlay,
      every node/.style={inner sep=0cm,outer sep=0cm}]
    \begin{scope}[on background layer]
      \fill[cvGreenLight] (current page.north west) rectangle %
        ++(\paperwidth,-\cvCoverLetterHeight);
    \end{scope}
    \draw (current page.north east) %
      ++(-0.5\paperwidth+0.5\cvCoverLetterWidth,
         -\cvCoverLetterHeight/2) node (cv@h7) {};
    \node[anchor=east] at (cv@h7) (cv cover letter name){%
      \fontsize{50}{60}\selectfont
      \begingroup\edef\y{\endgroup%
        \noexpand\kleft{\cv@FirstNameLetter}}%
      \y
      \StrGobbleLeft{\pgfkeysvalueof{/@cv/info/first name}}{1}\space
      \StrGobbleRight{\pgfkeysvalueof{/@cv/info/last name}}{1}
      \begingroup\edef\y{\endgroup%
        \noexpand\kright{\cv@LastNameLetter}}%
      \y
      };
    \node[%
      align=right,
      cvAccent,
      below=\cvCoverLetterPositionSpacing of cv cover letter name.south east,
      anchor=north east]{%
        \StrGobbleRight{\pgfkeysvalueof{/@cv/info/position}}{1}
    \begingroup\edef\y{\endgroup%
      \noexpand\kright{\cv@PositionLetter}}%
    \y};

    \begin{scope}[on background layer]
      \draw[line width=\cvCoverLetterLineWidth,cvGreen]
         ($(cv cover letter name.south west)+(0,-\cvCoverLetterLineSpacing)$) to
         ($(cv cover letter name.south east)+(0,-\cvCoverLetterLineSpacing)$);
    \end{scope}
  \end{tikzpicture}
  \vspace{\dimexpr\cvCoverLetterHeight-1in-\topmargin\relax}

  \today

  \vspace{\baselineskip}
  \cv@definecvBeneficiary
  \cv@definecvFullName
}{%
  \restoregeometry
}
\pgfkeys{/@cv/info/.is family,
         /@cv/info/.unknown/.style = %
         {\pgfkeyscurrentpath/\pgfkeyscurrentname/%
         .initial = #1}}
\NewDocumentCommand{\cvID}{mmmm}{
  \@IfNoValueOrEmptyTF{#3}{}{
    \begin{tikzpicture}
      \node[
        circle,
        text=white,
        minimum size=\cvPictureWidth,
        path picture={
          \node at (path picture bounding box.center){
            \includegraphics[width=\cvPictureWidth]{#3}
          };
        }]
        {};
    \end{tikzpicture}\\
  }
  {\LARGE
  \vspace{\cvIDNameSep}
  #1
  \vspace{\cvIDNameSep}
  #2}

  \vspace{\cvPositionSep}

  \@IfNoValueOrEmptyTF{#4}{}{\color{cvAccent} #4}

  \vspace{\cvPositionSep}
  {\globaldefs=1\relax\pgfkeys{/@cv/info/first name = %
    #1}\def\cv@FirstNameLetter{\extract{#1}{1}}}
  {\globaldefs=1\relax\pgfkeys{/@cv/info/last name = %
    #2}\def\cv@LastNameLetter{\extract{#2}{-1}}}
  {\globaldefs=1\relax\pgfkeys{/@cv/info/position = %
    #4}\def\cv@PositionLetter{\extract{#4}{-1}}}
}

\endinput
%%
%% End of file `limecv.cls'.
