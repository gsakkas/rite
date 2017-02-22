open EzyLangLevel

let _ =
  let pr_f = {
    pr_expr_feats = {
      (all_expr_feats true) with
        e_reference_update = false;     (* forbid [x := e] *)
        e_record_field_update = false;  (* forbid [x.f <- e] *)
        e_if_then = false;              (* forbid [if e then f] *)
        e_sequence = false;             (* forbid [e;f] *)
    };
    pr_struct_feats = {
      (all_struct_feats true) with
          s_annot_optional = false;   (* make annotations for global variables mandatory *)
          s_type = Some {
            (all_type_feats true) with
                t_record = Some false (* forbid declaration of mutable record fields *)
          }
    }
  } in
  configure pr_f [
    "Pervasives", true;
(*
    "Array", false;
    "Arg", false;
    "Buffer", false;
 *)
    "Char", false;
(*
    "Digest", false;
    "Filename", false;
 *)
    "List", false;
    "Random", false;
(*     "Sort", false; *)
    "String", false;
(*     "Sys", false; *)
  ] []
