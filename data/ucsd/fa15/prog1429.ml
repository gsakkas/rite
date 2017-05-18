
let rec assoc (d,k,l) =
  let (h1,h2)::t = l in
  match k with | h2 -> h1 | _ -> if l = [] then d else assoc (d, k, t);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
