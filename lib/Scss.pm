my grammar ScssGrammar {
    rule TOP {
        (<import_statement> | <scssrule>)*
    }

    rule import_statement {
        "@import" <-[\n]>+ ";"
    }

    rule scssrule {
        <selector_csv> '{' ( <property_kv> | <scssrule> )* %% ';'  '}'
    }

    rule selector_csv {
        <selector>+ %% ','
    }

    rule property_kv {
        <property_name> ':' <property_value>
    }

    token property_name {
        '-'?<alpha>(<.ident> | '-')*
    }

    token selector {
        (<tag_selector> <id_selector>? <class_selector>*
         | <id_selector> <class_selector>*
         | <class_selector>+)
    }

    token property_value { <-[;]>+ }

    token tag_selector { <.ident> }
    
    token id_selector { "#" <.ident>+ }

    token class_selector { "." <.ident>+ }
}

my class ScssToCSSConverter {
    method selector($/) {
        $/.make(~$0);
    }
}

class Scss {
    method convert( Str $scss_text ) {
        my $a = ScssToCSSConverter.new();
        my $x = ScssGrammar.parse( $scss_text, :actions($a) );
        return $x.ast;
    }
}
