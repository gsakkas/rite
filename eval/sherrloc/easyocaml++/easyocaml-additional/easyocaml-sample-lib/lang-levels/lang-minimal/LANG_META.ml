open EzyLangLevel

let _ =
  let min_patt = { (all_pattern_feats false) with p_var = true } in
  let ff = 
    { f_fun = false; f_pattern = min_patt } in
  let let_feats = { (all_let_feats false) with l_pattern = min_patt } in
  let ef =
    { (all_expr_feats false) with
          e_match = Some { (all_pattern_feats false) with p_var = true; p_wildcard = true; p_constant = true } ; 
          e_constant = true; 
          e_let_in = Some let_feats;
          e_simple_var = true; 
          e_function = Some ff;
          e_list = true;
          e_tuple = true;
          e_constructor = true;
          e_if_then_else = true; } in
  let sf =
    { (all_struct_feats false) with
          s_eval_expr = true;
          s_annot_optional = true;
          s_let = Some let_feats } in
  let prf = 
    { pr_expr_feats = ef; pr_struct_feats = sf } in
  configure prf ["List", true; "Pervasives", true] []
