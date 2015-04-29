use ScssGrammar;

class Scss {
    method convert( Str $scss_text ) {
        my $x = ScssGrammar.parse( $scss_text );
        say $x.gist;
    }
}
