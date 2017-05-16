
let rec assoc (d,k,l) =
  let h::t = l in
  if t = []
  then d
  else (let (x,y) = h in if x = k then y else assoc (d, k, t));;

let _ = assoc ((-1), "doe", ("no", 2));;
