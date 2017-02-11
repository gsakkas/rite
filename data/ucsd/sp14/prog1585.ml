
let rec assoc (d,k,l) =
  match l with | [] -> false | hd::tl -> (hd = k) || (assoc (d, k, tl));;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
