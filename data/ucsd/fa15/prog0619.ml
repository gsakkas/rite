
let rec assoc (d,k,l) =
  let h::t = l in
  if h = []
  then d
  else (let (x,y) = h in if x = k then y else assoc (d, k, t));;
