
let rec assoc (d,k,l) =
  match l with | [] -> "" | hd::tl -> (hd = k) || (assoc (d, k, tl));;
