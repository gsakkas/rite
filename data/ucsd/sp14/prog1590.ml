
let rec assoc (d,k,l) =
  match l with | [] -> "" | hd::tl -> if hd = k then hd || (assoc (d, k, tl));;
