

let _ =
  match Sys.argv with
    | [| _; expr |] ->
        Anfang.t Sys.argv.(1)
    | [| _; "o"; expr |] ->
        let ph = Parse.toplevel_phrase (Lexing.from_string expr) in
        exit (if Toploop.execute_phrase true Format.std_formatter ph then 0 else 1)
    | [| _; "e"; expr |] ->
        begin try 
          Clflags.easytyping := true ;
          let ph = Parse.toplevel_phrase (Lexing.from_string expr) in
          exit (if Toploop.execute_phrase true Format.std_formatter ph then 0 else 1)
        with exc ->
          exit 100
        end 
    | _ ->
        Printf.eprintf "give me [-] <expr>\n" ;
        exit 1
