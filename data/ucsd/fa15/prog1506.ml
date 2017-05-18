
let rec assoc (d,k,l) =
  match l with
  | [] -> print_string "empty" d
  | (ki,vi)::t ->
      (Printf.sprintf "%s %d\n" ki vi;
       if ki == k then vi else assoc (d, k, t));;
