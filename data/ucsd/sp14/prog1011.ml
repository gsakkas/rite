
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
  let rec assemble n =
    if n < 100000000
    then (n, (string_of_int n)) :: (assemble (n + 1))
    else [] in
  assemble 1;;

let _ = assoc ((-1), "99999", long_list);;
