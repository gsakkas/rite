
let rec assoc (d,k,l) =
  match l with | [] -> "not found" | hd::tl -> (hd = k) || (assoc (d, k, tl));;
