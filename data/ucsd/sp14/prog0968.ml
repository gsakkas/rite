
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | hd::tl -> (hd = k) || (assoc (d, k, tl));;
