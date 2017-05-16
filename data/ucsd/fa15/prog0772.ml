
let rec sumList n =
  let len = Array.length in
  if len == 1 then hd n else (hd n) + (sumList (tl n));;
