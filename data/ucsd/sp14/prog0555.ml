
let rec assoc (d,k,l) =
  let rec assoc_tl (d,k,l) t_res =
    match l with
    | [] -> d
    | (ki,vi)::tl ->
        if t_res
        then vi
        else
          if ki = k
          then assoc_tl (d, k, l) true
          else assoc_tl (d, k, tl) false in
  assoc_tl (d, k, l) false;;

let long_list =
  let rec assemble n l =
    if n < 1000000 then assemble (n + 1) ((n, (string_of_int n)) :: l) else l in
  assemble 1 [];;

let _ = assoc ((-1), "99999", long_list);;
