grammar ScssGrammar {
    rule TOP {
        <cssrule>*
    }

    rule cssrule {
        <selector> '{' <property_list> '}'
    }

    rule selector {
        <tag_selector> (<id_selector> | <class_selector>)*
        | (<id_selector> | <class_selector>)+
    }

    rule property_list {
        <property_kv>* %% ';'
    }

    rule property_kv {
        <property_name> ':' <property_value>
    }

    token tag_selector { <.ident> }

    token property_name { <cssident> }

    token property_value { <color> | <number> <unit>? }
    
    token color {
        <color_name>
    }

    token color_name {
        "red" | "blue"
    }

    token unit {
        :i
        [ px | cm | mm | in | pt | pc | em | ex | deg | rad | grad | ms | s | hz | khz ]
    }

    token id_selector {
        "#" <cssident>
    }

    token class_selector {
        "." <cssident>
    }

    token cssident {
        '-'?<alpha>(<.ident> | '-')*
    }


    token important_sym {:i '!'important }

    token number { <.digit>+ }

    token string      { ('"' | \') (<- nl>|\\ \n)*? $0 }

    token nl {\xA|"\r"\xA|"\r"|"\f"}
}
