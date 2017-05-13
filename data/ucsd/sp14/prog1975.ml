
let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::tl -> if ki = k then vi else assoc (d, k, tl)
  | _ -> d;;

let _ = assoc ([], 123, [(123, "sad"); (321, "happy")]);;
