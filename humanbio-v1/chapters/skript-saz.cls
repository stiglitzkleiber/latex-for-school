						%% skript-saz.cls -- Kaspar's modified ``scrartcl.cls''
						\NeedsTeXFormat{LaTeX2e}\relax
						\ProvidesClass{skript-saz}[2013/10/10 scrartl class for school]
						%% Lade nun ``scrartl.cls'' - die Optionen müssen aber im jeweiligen Arbeitsfile
						%% (resp. der Vorlage) angegeben werden!! -- mit \DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{scrartcl}}  und anschliessend dem 
						%% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}} 
						%% \ProcessOptions\relax  und schliesslich   \LoadClass{scrartcl}  kann zwar
						%% die default Schrift vorgegeben werden und das Papier, aber viele andere 
						%% Voreinstellungen führten nicht zum gleichen Ergebnis, als wenn ich die Optioen
						%% beim .cls Aufruf lade!!
						%
						\LoadClassWithOptions{scrartcl}
						% ************  Textkörper definieren   ************
						% % \usepackage{typearea}	% ist in KOMA bereits enthalten
% 						 \newlength{\CharsLX}% Breite von 60 Zeichen
						% \settowidth{\CharsLX}{\texttt{1234567890}}
% 						 \setlength{\CharsLX}{10\CharsLX}
						% \areaset[0cm]{\CharsLX}{22cm}
						% % \areaset[-4cm]{10.5cm}{22cm}		% \areaset[BCOR ]{Breite }{Höhe }
						% %  \setlength{\marginparwidth}{1\marginparwidth} % vgl. KOMA ... steuert Randnotizanteil in der Randspalte
							 \areaset[0cm]{11.5cm}{26cm}
							 \setlength{\marginparwidth}{0.9\marginparwidth}  %KOMA: Randnotiz
							 \usepackage{marginfix} %damit Randnotizen nicht unten herauslaufen
						%****************************
						%
						%% Ab hier kann man Aenderungen an den Makros der geladenen Klasse
						%% durchfuehren (bitte mit \renewenvironment oder \renewcommand!),
						%% Pakete hinzuladen und/oder eigene Anweisungen und Umgebungen
						%% definieren:
						%
						\newcommand{\moderate}{%  \moderate minimiert den Fehler overfull hbox
												\tolerance 1414
												\hbadness 1414
												\emergencystretch 1.5em
												\hfuzz 0.3pt
												\vfuzz \hfuzz
												\relax
												} 
%
		\usepackage{etex}% um im Notfall Platz zu machen, neue Packete zu laden -- geht auf Kosten der Geschwindigkeit
		\reserveinserts{30}%  gehört zu etex!
						%
						%
						%*** Mulitcolumn **************************************
						\usepackage{multicol} %ermoeglicht besseren Mehrspaltensatz als der Befehl \twocolumn[text]
						\setlength{\columnsep}{1.8pc}	%definiere Abstand zwischen den Spalten
						\setlength{\columnseprule}{0pt}  %zeichne eine Linie zwischen den Spalten mit 0.3pt Dicke
						%
						%**** Umgebung fuer haengenden Einzug*************
						\newenvironment{hanging}[1][2em]{\addmargin[#1]{0pt}\setlength{\parindent}{-#1}\hspace*{-#1}\ignorespaces}{\endaddmargin}	
						%
% *** Sprache und Schrift ******************************************
\usepackage[T1]{fontenc} %font encoding fuer dt Umlaute
\usepackage[utf8]{inputenc} %evtl. utf8x might be better - or worse
\usepackage[UKenglish,ngerman]{babel}
\usepackage{textcomp}	%zusätzliche Zeichen
\usepackage{microtype}  %nachträglich optischer Randausgleich bei pdfs (nur wenige Schriften!)
\usepackage{lmodern}	%in pdf besser lesbare LaTexStandardschrift
\usepackage[normalem]{ulem} %Durchstreichung u.a. Textauszeichnungen  \sout (durchstreichen)
\renewcommand{\textrightarrow}{$\rightarrow$}
  \renewcommand{\textleftarrow}{$\leftarrow$}
%
%****Schriftenwahl global (see: psfnss2.pdf):  **************************
%\usepackage[scaled=.92]{helvet} \renewcommand{\familydefault} {\sfdefault} %NUR Helvetica
 \usepackage[osf,sc]{mathpazo} % zusammen mit microtype: ComputerModernRoman (default); Palatino ([osf,sc]{mathpazo}) Times, URW-Garamond; Adobe-Garamond; Adobe-Minion; Bitstream-Charter ({charter}); Letter-Gothic, AMS-symbols; Euler-fonts
 %Nicht unterstützt von microtype: courier({pcr}); bookman&pag&pcr ({pbk}); AvantGarde(pag); times(ptm); palatino(ppl); arial; chancery; iwona; newcent(pnc); bookman
 \linespread{1.05} %nötig nur für Palatino (mathpazo)
\newcommand{\changefont}[3]{
\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}  
% -- im DOKUMENT Schrift temporaer wechseln --- % \changefont{pag}{b}{sc}  % mit \begin{group} und \end{group}  bis Folge-Abschnit Schrift pag mit bold und slanted
%
\newcommand{\origttfamily}{}% sollte noch nicht definiert sein!
\let\origttfamily=\ttfamily % alte Definition von \ttfamily sichern
\renewcommand{\ttfamily}{\origttfamily \hyphenchar\font=`\-}
%
% % Symbole festlegen % %ge[normalem]{ulem} %Durchstreichung u.a. Textauszeichnungen  \sout (durchstreichen)
\usepackage{amsmath,amssymb,amstext}
\usepackage[amssymb]{SIunits} %    schreibe \micro \mole  \ohm  \milli\metre  \square\metre \metrepersquaresecond
				% use  \  to separate a unit from following text!   units will be set in AMS style 
\usepackage{textcomp}  % enthaelt Befehl für \textdegree (= Gradzeichen)
\usepackage{marvosym} % enthaelt \Male \Female u.a.
\usepackage{bbding} % vgl. auch: http://tex.stackexchange.com/questions/52536/how-to-use-bbding-package	
\usepackage{pifont}  %Sammlung von Spezialzeichen nuetzen mit \ding{##} oder \dingline{##}
%\usepackage{isotope}	%stellt die Isotopen - also auch Ionen - typographisch korrekt dar; Syntax ist  \isotope[][]{Ra} oder $Ca^{2+}$   %% für Chemie / Bio ist Package mchem besser geeignet!
\usepackage[version=4]{mhchem}	%schreibe    \ce{Ca2+}  oder \ce{H2O} %% VErsion 4 nötig mit chemfig package

\usepackage{simpsons}
%
%
% ****   Logische Funktionen ermoeglichen    ****************************************
\usepackage{environ} %Zur Definition von neuen Environments mit fixen Eintraegen
\usepackage{ifthen}
\usepackage[automark, nouppercase]{scrpage2}
\usepackage{verbatim}
\usepackage{comment}



% ##### Bilder, Grafiken, Tabellen################################
\usepackage{blindtext}
\usepackage[usenames,dvipsnames]{xcolor}  %for colors and for doing own graphics
\usepackage[pdftex]{graphicx} % mit \includegraphics[]{}  Bilder einfuegen
\usepackage{picins}   %Alternative zu graphicx, mit \parpic{} auch in multicols!
\usepackage{wallpaper} %Für Hintergrundbilder seitenfüllend (Titelseite)
\usepackage{wrapfig} %Bilder von Text umflossen setzen
\usepackage{pict2e}  %zum zeichnen von Linien, Pfeilen, Kreisen (u.a. fuer den Schraegstrich im PunnettSquare)
% \usepackage{pgf}   %Elemente von portable graphics format
\usepackage{tikz}
\usepackage{pgfplots}  %used with tikz for plotting functions
 \pgfplotsset{compat=1.9}
\usepackage{soul}
%
%******************    Kreise um Buchstaben ************************
    \newcommand\kreis[1]{\ensuremath{\mathbin{\settowidth{\dimen7}{\mbox{$ \bigcirc$}}%
    \makebox[0pt][l]{$\bigcirc$}\makebox[\dimen7]{#1}}}}
%
\newcommand\titelref[1]{\textbf{\ref{#1}.~~\nameref{#1}~}}
\usepackage{tabularx}	%fuer Spalten mit variabler Breite
\usepackage{longtable}  %gibt Probleme --- vgl. KOMA-Bibel, wie Knuth das umgeht....
\usepackage[figuresright]{rotating}  %für querformat-Tab mit \{begin}sidewaystable
\usepackage{subfigure}
\usepackage{booktabs}	%fuer top- mid- bottomrule
\usepackage{colortbl} 	 %um mit \color spezifizierte Farben in Tabellen zu nutzen
\usepackage{diagbox}  %fuer Box mit Diagonalstrich, e.g. in Punnett squares  (slashbox ist veraltet, in diagbox enthalten =?)
% \usepackage[framemethod=default]{mdframed}
%
\newcommand\redout{\bgroup\markoverwith
{\textcolor{red}{\rule[.5ex]{2pt}{0.6pt}}}\ULon}
\usepackage{fancybox}
\usepackage[framemethod=TikZ]{mdframed} % Boxen über Seiten
	\global\mdfdefinestyle{RedGray}{%
	linecolor=red,linewidth=1.5pt,%
	leftmargin=1cm,rightmargin=1cm,%
	backgroundcolor=gray!40
	}
\usepackage{array} 	%in Tabellen, um dickere Striche zu ziehen
\pagecolor{white}  %% trick to allow pagecolors in pdfpages
\usepackage{pdfpages}   %zum Einbinden von pdf Dokus
\pdfoptionpdfminorversion=6  %sonst Fehlermeldung wegen Version zu hoch
\usepackage{pdflscape}
\usepackage{afterpage}
%***********************************************
%caption wurde neu per koma statt extrapackage geregelt:
%  !!!!!!    \captionsetup{type=figure}  überall löschen!!!
\addtokomafont{caption}{\footnotesize}	%Format der Bildlegenden
\setkomafont{captionlabel}{\sffamily\bfseries}  % Format von "`Abb. X:"'
\setcapindent{1em}   %Einzug nach "`Abb. X:"'  vgl. KOMA 
% \usepackage{caption} %enthaelt /captionof, um in multicol Doku Bilder anzuschreiben
% \captionsetup{font={{footnotesize}},labelfont=bf,format=hang,justification=RaggedRight,singlelinecheck=false}  %Layout der Bildlegenden
%
%
%*****   Literatur und Bibliographie   **************************************
%\usepackage{bibgerm}
\usepackage{bibentry}
\usepackage[round]{natbib} % 	mit citep und citet Befehlen 
\usepackage{endnotes}  %  gibt v.a. Probleme!!!
\usepackage{todonotes}	% erzeuge orange Blase mit todo im .pdf mit \todo{my note}
 \newcommand{\todol}[1]{\ifthenelse{\boolean{@loesunganzeigen}}{\todo{#1}}{}}
  \newcommand{\anotel}[1]{\ifthenelse{\boolean{@loesunganzeigen}}{\todo[color=green!40]{#1}}{}}
    \newcommand{\anote}[1]{\todo[color=green!40]{#1}}


%% URL darstellenn  **************** 
\usepackage[hyphens]{url} %  [hyphens] sorgt fuer korrekte Trennungen der url
%\urlstyle{tt}
% Define a new 'leo' style for the package that will use a smaller font:
				\makeatletter
				\def\url@leostyle{%
				  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
				\makeatother
				% Now actually use the newly defined style.
				\urlstyle{leo} %  default style waere  \urlstyle{tt}  - aber font dann zu gross
				%
				%
				%
%%%%%%%%%%%%%%%              \fillwithlines				%%%%%%%%%%%
				\makeatletter
				%
				%   (this code was copied from the exam.cls sheet))
				% \fillwithlines takes one argument, which is either a length or \fill,
				% and it fills that much vertical space with horizontal lines that run
				% the length of the current line.  That is, they extend from the
				% current left margin (which depends on whether we're in a question,
				% part, subpart, or subsubpart) to the right margin.
				%
				% The distance between the lines is \linefillheight, whose default value
				% is set with the command
				%
				% \setlength\linefillheight{.25in}
				%
				% This value can be changed by giving a new \setlength command.
				%
				% The thickness of the lines is \linefillthickness, whose default value
				% is set with the command
				%
				% \setlength\linefillthickness{.1pt}
				%
				% This value can be changed by giving a new \setlength command.
				%
				\makeatletter
				\newlength\linefillheight
				\newlength\linefillthickness
				\setlength\linefillheight{.25in}
				\setlength\linefillthickness{0.1pt}
				%
				\newcommand\linefill{\leavevmode
				    \leaders\hrule height \linefillthickness \hfill\kern\z@}
				%
				%
				\def\fillwithlines#1{%
				  \begingroup
				  \ifhmode
				    \par
				  \fi
				  \hrule height \z@
				  \nobreak
				  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
				          \vrule height \linefillheight depth \z@ width \z@
				          \linefill}%
				  % We use \cleaders (rather than \leaders) so that a given
				  % vertical space will always produce the same number of lines
				  % no matter where on the page it happens to start:
				  \cleaders \copy0 \vskip #1 \hbox{}%
				  \endgroup
				}
%%%%%%%%%%%%%%%       \fillwithdottedlines       %%%%%%%%%%%%%%%%%%%%
				%
				%     (this code was copied from the exam.cls sheet))
				% \fillwithdottedlines is similar to \fillwithlines, except that it
				% fills the space with dotted lines (created by \dotfill) rather than
				% with solid lines.
				%
				% \fillwithdottedlines takes one argument, which is either a length or
				% \fill, and it fills that much vertical space with dotted lines that
				% run the length of the current line.  That is, they extend from the
				% current left margin (which depends on whether we're in a question,
				% part, subpart, or subsubpart) to the right margin.
				%
				% The distance between the lines is \dottedlinefillheight, whose
				% default value is set with the command
				%
				% \setlength\dottedlinefillheight{.25in}
				%
				% This value can be changed by giving a new \setlength command.
				%
				\newlength\dottedlinefillheight
				\setlength\dottedlinefillheight{2.4em}
				%
				\def\fillwithdottedlines#1{%
				  \begingroup
% 				  \ifhmode
% 				    \par
% 				  \fi
				  \hrule height \z@
				  \nobreak
				  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
				          \vrule height \dottedlinefillheight depth \z@ width \z@
				          \dotfill}%
				  % We use \cleaders (rather than \leaders) so that a given
				  % vertical space will always produce the same number of lines
				  % no matter where on the page it happens to start:
				  \cleaders \copy0 \vskip #1 \hbox{}%
				  \endgroup
				  }
	  %Definiere eine neue Umgebung "`fillR"' welche eine parbox aufzieht welche über die Textbreite bis zum Seitenrand reicht und diese Box mit gestrichelten Linien füllt
		  \def\fullwidth{\textwidth+1\marginparwidth}
			\def\fillwithdottedlinesR[#1]#2{\\ \begin{minipage}{#2}%\textwidth+1\marginparwidth
			{ \begingroup
% 				  \ifhmode
% 				    \par
% 				  \fi
				  \hrule height \z@
				  \nobreak
				  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
				          \vrule height \dottedlinefillheight depth \z@ width \z@
				          \dotfill}%
				  % We use \cleaders (rather than \leaders) so that a given
				  % vertical space will always produce the same number of lines
				  % no matter where on the page it happens to start:
				  \cleaders \copy0 \vskip #1 \hbox{}%
				  \endgroup
				  }%
			\end{minipage}
			}%
			
				%
		% %%%%%%%%%%%%%%%              \makeemptybox				%%%%%%%%%%%			
		% 			%
		% 			% \makeemptybox takes one argument, which is a length, and it creates
		% 			% an empty box of width the length of the current line and of height
		% 			% equal to the argument. That is, the box extends from the current
		% 			% left margin (which depends on whether we're in a question, part,
		% 			% subpart, or subsubpart) to the right margin.
		% 			%
		% 			% As of version 2.304, the argument of \makeemptybox can be either
		% 			% a length, or \fill, or \stretch{number}.
		% 			%
		% 			% \newcommand\makeemptybox[1]{
		% 			%   \par
		% 			%   \begingroup
		% 			%     \setlength{\fboxsep}{0pt}%
		% 			%     \framebox[\linewidth]{%
		% 			%       \vrule height 0pt depth #1 width 0pt
		% 			%     }%
		% 			%   \endgroup
		% 			% }
		% 			%
		% 			\newlength\minboxheight
		% 			\setlength\minboxheight{.1in}
		% 			%
		% 			\newcommand\makeemptybox[1]{%
		% 			  \par
		% 			  \hbox to \hsize{\hskip\@totalleftmargin \leaders\hrule\hfill}%
		% 			  \nointerlineskip
		% 			  \begingroup
		% 			    \setbox0=\hbox to \hsize{\hskip\@totalleftmargin
		% 			                           \vrule height\minboxheight \hfill \vrule}%
		% 			    % The vertical size desired may not be an exact multiple of
		% 			    % \minboxheight, and so \cleaders might leave a gap between the
		% 			    % vertical lines and the horizontal lines above and below it.
		% 			    % Thus, we put a single copy of \box0 immediately below the
		% 			    % horizontal line above and we'll also put a single copy of \box0
		% 			    % immediately above the horizontal line below.
		% 			    \copy0
		% 			    \nobreak
		% 			    \vskip -\minboxheight
		% 			    \cleaders \copy0 \vskip #1
		% 			    \vskip -\minboxheight
		% 			    \nointerlineskip
		% 			    \copy0
		% 			  \endgroup
		% 			  \nointerlineskip
		% 			  \hbox to \hsize{\hskip\@totalleftmargin \leaders\hrule\hfill}%
		% 			}
		% 			%
		% 			\makeatother
		% 			%
\newcommand{\Answer}[2]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{ForestGreen}\scshape
{#1}\egroup}{\bgroup\color{ForestGreen}\scshape
{#1}\egroup}%
 }
\newcommand{\Loesung}[2]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{red}\scshape
{#1}\egroup}{\fillwithdottedlines{#2}}%
 }
% \newcommand{\Loesunglang}[2]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{red}\bfseries {#1}\egroup}{\fillwithdottedlines{#2}} }
% 	\makeatletter
% 	\newboolean{@loesunganzeigen}
% 	\setboolean{@loesunganzeigen}{false}
% 	\DeclareOption{Loesunglang}{\setboolean{@loesunganzeigen}{true}}
% 	\makeatother

   \newcommand{\Ersatz}[2]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{red}\scshape
{#1}\egroup}{#2}% 
 }% % ins .cls  
 		\newcommand{\Lehrer}[1]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{red}{#1}\egroup}}  %% \Lehrer{nur in Lösung anzuzeigen}

% 		 	 	\newcommand{\Kommentar}[4]{\ifthenelse{\boolean{@loesunganzeigen}}{\bgroup\color{magenta}\ttfamily{#1}\egroup}
% 	 { \begin{tikzpicture}%
% 	  \ifthenelse{\equal{#4}{\empty}}{\def\breite{1\textwidth}}{\def\breite{#4}}
% 	 \ifthenelse{\equal{#2}{\empty}}{}{
%         \draw[step=0.4cm,color=gray	,opacity=0.6] (0,0) grid (\breite,#2)};    \end{tikzpicture}%
% 	\vspace{#3}}%
% 	 }	 

\makeatletter
	%% eigene Routine für das Setzen von Notizenseiten
		\newboolean{@zweiseitenkommentar}
		\setboolean{@zweiseitenkommentar}{false}
		\DeclareOption{zweiseitenkommentar}{\setboolean{@zweiseitenkommentar}{false}}
		%
		\ProcessOptions
\makeatother
% % Original-version: zu komplex, krieg ich nicht mehr hin %%%% 
% % 	\newcommand{\commentpage}[1]{\ifthenelse{\boolean{@loesunganzeigen}}{
% % % 		 \setboolean{@zweiseitenkommentar}{#1}
% % 	\bgroup
% % 	\bfseries\ttfamily \color{red} \large
% % 		\checkoddpage
% % 		\ifthenelse{\boolean{oddpage}}{
% % 		\clearpage
% % 		this is a blank page --> a comment follows
% % 		\clearpage
% % 	{#2}
% % 		 \ifthenelse{\boolean{@zweiseitenkommentar}}{	 }{
% % 		\clearpage
% % 		\ldots this page is intentionally left blank \ldots
% % 		}
% % 		\clearpage
% % 		 \addtocounter{page}{-3}
% % 		}{
% % 		\clearpage
% % 	{#2} 
% % 		\clearpage 
% % 		\ldots this page is intentionally left blank \ldots
% % 		\clearpage \addtocounter{page}{-2}
% % 		}
% % 		\egroup}
% % 		}%
% % % %%%%%
%%% einfache Version: selber dafuer sorgen, dass Kommentar auf ungerade Seite kommt: %%%%%%%%%
		\newcommand{\commentpage}[1]{\ifthenelse{\boolean{@loesunganzeigen}}{
% 		 \setboolean{@zweiseitenkommentar}{#1}
	\bgroup
	\bfseries\ttfamily \color{red} \large
		% 		\checkoddpage
% 		\ifthenelse{\boolean{oddpage}}{
% 		\clearpage
% 		this is a blank page --> a comment follows
		\clearpage \pagecolor{red!10}
	\textsc{Kommentar:}\\[6pt]
	{#1}
% 		 \ifthenelse{\boolean{@zweiseitenkommentar}}{	 }{
		\clearpage
		\ldots this page is intentionally left blank \ldots
% 		}
		\clearpage
		 \addtocounter{page}{-2}
		 \egroup 	\nopagecolor
		}
		{}}
%%%%%%%%%%%%%%%%%%%%%%%%%		
		
 		
%%%%%%%%%  Hacks aus dem schule.sty Packet   %%%%%%%%%%%%%%			
\RequirePackage{xspace}
\RequirePackage{ragged2e}
\RequirePackage{paralist}
\RequirePackage{textcomp}
\RequirePackage{xmpincl}
\RequirePackage{multirow}
\makeatletter
\newboolean{@loesunganzeigen}
\setboolean{@loesunganzeigen}{false}
\DeclareOption{loesung}{\setboolean{@loesunganzeigen}{true}}
\newboolean{@loesunganzeigen@Seite}
\setboolean{@loesunganzeigen@Seite}{false}
\DeclareOption{loesungseite}%
{\setboolean{@loesunganzeigen@Seite}{true}\newcounter{@loesung@nr}}
\DeclareOption{loesungsseite}%
{\setboolean{@loesunganzeigen@Seite}{true}\newcounter{@loesung@nr}}

\ProcessOptions
\newcommand{\loesung}[1]{
\ifthenelse{\boolean{@loesunganzeigen}}
{\textbf{\textcolor{red}{#1}}}
{\fillwithdottedlines{4cm}}
\ifthenelse{\boolean{@loesunganzeigen@Seite}}
{\label{loesung@\the@loesung@nr}\global\expandafter\def\csname
loesung@\the@loesung@nr\endcsname{#1} \addtocounter{@loesung@nr}{1}}
{\luecke{#1}}
}
\newcount\@pruefwert
\newcount\zeitanzeigen
\@pruefwert=1
\zeitanzeigen=1
\newcommand{\zeitpunkt}[1]{
\ifnum \zeitanzeigen=\@pruefwert
\multicolumn{4}{| >{\bfseries}l|}{~~~#1} \\ \hline
\fi}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%  Es folgen die Layout-Angaben  %%%%%
\usepackage[inline]{enumitem}  %schoene Aufzaehlungen
	
	%**Aufzählungen ab 27.11.17 **
	\usepackage[inline]{enumitem}  %schoene Aufzaehlungen
	\setenumerate[1]{font=\textbf,labelindent=-20pt,label=\Large\ding{46}~~\arabic*} 
	\setenumerate[2]{label*=\alph*.}
% 		%**Aufzählungen wie 2015 von mir definiert **
		% \setenumerate[1]{font=\textbf,labelindent=-20pt,label=\ding{46}~~\thesection.\alph*} %war vorher  \arabic*
		% \setenumerate[2]{label*=\arabic*.}


%  \newcommand{\lire}{\ifthispageodd{\SetEnumitemValue{leftmargin}{quest}{*},\SetEnumitemValue{rightmargin}{questR}{-1.1\marginparwidth}}{\SetEnumitemValue{leftmargin}{quest}{-1.1\marginparwidth}}}

  \newcommand{\lire}{\ifthispageodd{\SetEnumitemValue{leftmargin}{quest}{0\marginparwidth},\SetEnumitemValue{rightmargin}{questR}{-1.2\marginparwidth}}{\SetEnumitemValue{leftmargin}{quest}{-1\marginparwidth},\SetEnumitemValue{rightmargin}{questR}{0.2\marginparwidth}}}


  
  
%  graue Textbox für die Marginalie definieren:
\newcommand{\graymarginnote}[1]{\marginpar{\hyphenchar\font=\string"7F{\colorbox{gray!25}{\parbox{\dimexpr\marginparwidth-2\fboxsep\relax}{\raggedright{#1}}}}}}
% umrahmte Textbox  (fbox)mit autom. Zeilenumbruch (parbox)
\newcommand{\fboxp}[2]{\begin{center}\fbox{\parbox{#1}{\begin{center}\vspace{-0.6em}#2\end{center}\vspace{-0.8em}}}\end{center}}
  
%  \ifthispageodd{\SetEnumitemValue{leftmargin}{standard}{*}}{\SetEnumitemValue{leftmargin}{standard}{-1.1\marginparwidth}}

% \SetEnumitemValue{leftmargin}{standard}{{\ifthispageodd{0pt}{-1.1\marginparwidth}}}

% \ifthispageodd{Dann-Teil}{Sonst-Teil}

\newcommand{\karo}[2]{ %   kariertes Papier zeichnen
        \begin{tikzpicture}%
        \draw[step=0.4cm,color=gray	,opacity=0.6] (0,0) grid (#1,#2);%
        \end{tikzpicture}%
 }

%
 \newcommand{\hrefL}[3]{\ifthenelse{\boolean{@loesunganzeigen}}{\href{#1}{#3}}{\href{#2}{#3}}}%
%
	\newcommand{\links}{$\leftarrow$}
% 	\angle{180}{\ding{217}} =?
	\newcommand{\rechts}{$\rightarrow$}
%	\ding{217}  %schöner als arrow
	\newcommand{\linksrechts}{$\leftrightarrow$}
\usepackage{needspace} %haelt Zeilen zusammen mit \needspace{4\baselineskip}
\usepackage{dashrule} %fuer gepunktete Linien ueber die Seitenbreite
\usepackage{setspace} %fuer horizontale Luecken
% \usepackage[modulo]{lineno} %Zeilennummern, modulo macht eine Nummer alle 5 Zeilen default
		%\def\linenumberfont{\scriptsize\rmfamily} % Zeilen-Nr als Serife und kleiner als Standard
\pagestyle{scrheadings} %  komplexe header und footer
% \setfootsepline[0pt ]{0pt}  % Fusszeile OHNE Lin
%\pagestyle{plain} %   kein header; in footer nur die Seitenzahl  setze {empty}  fuer gar nichts
\usepackage{currfile} %   erm?glicht die Ausgabe des aktuellen Filenamens (z.B. in der Fusszeile)
%\setkomafont{pageheadfoot}{\normalfont\normalcolor\itshape\small} %   Schrift fuer header und footer
%\setkomafont{pagenumber}{\normalfont\bfseries} %    Schrift fuer Seitenzahl festlegen
\renewcommand*{\partformat}{\thepart\autodot\enskip}
\renewcommand*{\partheadmidvskip}{}
		\setkomafont{part}{\Huge\ttfamily\bfseries}
	\makeatletter
	\setkomafont{partnumber}{\usekomafont{part}\@hangfrom}
	\makeatother
				\clearscrheadfoot
		\ifoot{\vspace{-6pt}KZU biologie saz}
		\cfoot{\vspace{-6pt}\textit{\currfilename}}
		\ofoot{\vspace{-6pt}S. \thepage}
	      %\ohead{THEMA}
% 		 \chead{\ifthenelse{\equal{\Sol}{ja}}{\textcolor{red}{LOESUNGEN}}{}}
% 		 \ihead{Kapitel \thesection}
	\ihead{\leftmark}
% 
% 
% 
% ***********************************************************
\newenvironment{stundenverlauf}{
% \hspace{-0.8cm} \textbf{Lektionsprotokoll:}\\
\hspace{-2cm}
\RaggedLeft \setlength\extrarowheight{0pt}
\tabularx{1.2\textwidth}{|>{\color{red}}p{2.5cm}|>{\color{blue}}X|>{\color{blue}}p{1.3cm}|>{\color{blue}}p{2.6cm}|
% >{\color{purple}}p{2cm}|
}  %
\hline \textbf{Phase}& \textbf{Operationen / Sachaspekte}& \textbf{Akt / Soz}& \textbf{Med / Vorb}
% & \textbf{Kommentar}
\\ \hline }
{\endtabularx  \justifying\newpage}
%****************************************************************
%
%
%% Schliesslich wird die Klassendatei `sauber' beendet':
\endinput
%% End of ``skript-saz.cls''
