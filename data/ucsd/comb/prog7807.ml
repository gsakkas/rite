
let rec cloneHelper x n l =
  if n <= 0 then [] else (cloneHelper x (n - 1) x) :: l;;
