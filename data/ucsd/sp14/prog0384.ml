
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;
