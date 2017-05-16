
let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::tl -> if ki = k then vi else assoc (d, k, tl)
  | _ -> d;;

let _ = assoc ((-1), 'd', [("d", 1)]);;
