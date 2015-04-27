grammar ScssGrammar {
    rule TOP {
        <cssrule>*
    }

    rule cssrule {
        <selector> '{' <property_list> '}'
    }

    rule selector {
        (<tag_selector> (<id_selector> | <class_selector>)* | (<id_selector> | <class_selector>)+)+ %% ','
    }

    rule property_list {
        <property_kv>* %% ';'
    }

    rule property_kv {
        <property_name> ':' <property_value>
    }

    token tag_selector { <.ident> }

    token property_name {
        '-'?<alpha>(<.ident> | '-')*
    }

    token property_value { <-[;]>+ }
    
    token id_selector {
        "#" <.ident>+
    }

    token class_selector {
        "." <.ident>+
    }

}
