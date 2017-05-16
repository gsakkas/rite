
let rec sumList n =
  let len = Array.length n in if len == 1 then 1 else 1 + (sumList (n - 1));;
