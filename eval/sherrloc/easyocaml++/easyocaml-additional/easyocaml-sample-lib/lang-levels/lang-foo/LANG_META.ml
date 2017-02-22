open EzyLangLevel

(* 1/ match expressions are allowed but the patterns are not allowed to be nested.
 * 2/ exception handling is disallowd
 *)

let _ =
  let match_pf =
    let full_pf = all_pattern_feats true in
    { full_pf with p_nested = false } in
  let prf = 
    let full_ef = all_expr_feats true in {
      pr_expr_feats = { full_ef with e_try = None; e_match = Some match_pf; e_raise = false } ;
      pr_struct_feats = all_struct_feats true ;
    } in
  configure prf [("M1", true); ("M2", false); ("List", true); ("String", false)] ["m1.cmo"; "m2.cmo"]
