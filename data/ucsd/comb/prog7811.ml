
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((cloneHelper 0) - (1 * diff)) @ l1
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;
