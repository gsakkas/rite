
let rec sumList n =
  let len = Array.length in if len == 1 then 1 else (hd n) + (sumList (tl n));;
