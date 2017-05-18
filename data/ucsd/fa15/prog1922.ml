
let rec assoc (d,k,l) =
  let h::t = l in
  let f::e = h in
  if f = k then e else if t = [] then [(-1)] else assoc (d, k, t);;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
