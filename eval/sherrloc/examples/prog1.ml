let f(lst: int list ): ( float * float ) list =
let rec loop lst x y dir acc =
  if lst = [] then
    acc
  else
    print_string "foo" (* true mistake *)
  in
List.rev (loop lst 0.0 0.0 0.0 [(0.0,0.0)] ) (* OCaml blames [(0.0,0.0)]*)
