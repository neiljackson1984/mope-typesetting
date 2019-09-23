\version "2.18.2"
#(ly:set-option 'point-and-click #f)

\include "notesandwords.liy"



 
#(set-global-staff-size 16)


\paper
{
	% line-width = 6.5\in
    left-margin = 1\in
    right-margin = 1\in
    top-margin = 1\in
	
	print-first-page-number = ##t
	#(set-paper-size "letter")
	% ragged-bottom = ##t
	print-all-headers = ##t
	% system-count = #4

	% oddHeaderMarkupOld = #oddHeaderMarkup
 	% oddHeaderMarkup = #evenHeaderMarkup
	% evenHeaderMarkup = #oddHeaderMarkupOld
	scoreTitleMarkup = #bookTitleMarkup 
    first-page-number=#23
}


scorecontents = 
{
	\new StaffGroup
	<<

		\new Staff = soprano
		<<
			\set Staff.instrumentName = "soprano"
			\set Staff.midiInstrument = #"voice oohs"
      			\set Staff.midiMinimumVolume = #0.7
      			\set Staff.midiMaximumVolume = #0.7
			\new Voice = soprano
			<<
				\clef treble
				\sopranoMusic
			>>
			%\new Voice = hiddenlayoutvoice	\breakMask
		>>
		\new Lyrics \lyricsto "soprano" \sopranowordsall

		
		\new Staff = alto
		<<
			\set Staff.instrumentName = "alto"
			\set Staff.midiInstrument = #"voice oohs"
      			\set Staff.midiMinimumVolume = #0.7
      			\set Staff.midiMaximumVolume = #0.7
			\new Voice = alto
			<<
				\clef treble
				\altoMusic
			>>
			%\new Voice = hiddenlayoutvoice \breakMask
		>>
		\new Lyrics \lyricsto "alto" \altowordsall
		

		\new Staff = tenor
		<<
			\set Staff.instrumentName = "tenor"
			\set Staff.midiInstrument = #"voice oohs"
      			\set Staff.midiMinimumVolume = #0.7
      			\set Staff.midiMaximumVolume = #0.7
			\new Voice = tenor
			<<
				\clef "treble_8"
				\tenorMusic
			>>
			%\new Voice = hiddenlayoutvoice \breakMask
		>>
		\new Lyrics \lyricsto "tenor" \tenorwordsall



		\new Staff = bass
		<<
			\set Staff.instrumentName = "bass"
			\set Staff.midiInstrument = #"voice oohs"
      			\set Staff.midiMinimumVolume = #0.7
      			\set Staff.midiMaximumVolume = #0.7
			\new Voice = bass
			<<
				\clef bass
				\bassMusic
			>>
			%\new Voice = hiddenlayoutvoice \breakMask
		>>
		\new Lyrics \lyricsto "bass" \basswordsall
	>>
}


\book
{
    \header
    {
        tagline =  "Engraved 2019 in Seattle for The Meridian Ensemble; Yuly Kopkin, Artistic Director"
    }

    \markuplist{
    
        \justified-lines{ This is the cover page.  }
        \justified-lines{
            The only purpose of this page is to make two-sided printing work correctly, and to make 
            the page breaks match the original score, which will facilitate transcription of the original score.
        }
    }
    \pageBreak

    \score
    {
        %  print bar numbers on every measure (to aid manual note entry - not for production)

        \transpose c c \scorecontents



        \layout{
            %indent = 1\in

            \context{
                \Staff
                % \remove Instrument_name_engraver
                % \accidentalStyle voice
                \accidentalStyle modern-voice-cautionary
                \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 12))
                % \override Staff.BarLine.allow-span-bar = ##t
            }
            
            \context{
                \Score
                %print the 2/4 and 4/4 time signatures with numerals rather than the "C" and "C"-with-a-vertical-line symbol
                \numericTimeSignature
                
                %  print bar numbers on every measure (to aid manual note entry - not for production)
                \override BarNumber.break-visibility = ##(#f #t #t)
            }
            
            \context{
                \Lyrics
                % \override LyricText.color=#red
            }
        }
        
        \header
        {
            title = \markup{ \caps {MOPE N YTEC} } 
            composer = "<composer goes here>"
            poet = \markup {
              \column {
                \line {
                  "words by TIOTHEBA"
                }
                \line {
                    phonetization for English speakers by Yuly Kopkin
                }
              }
           }
            % arranger = "typeset by Neil Jackson"
            % breakbefore = ##f
        }
        \midi
        {
            \context 
            {
                \Score
                tempoWholesPerMinute = #(ly:make-moment 60 4)	
            }
        }

    }	
}
	