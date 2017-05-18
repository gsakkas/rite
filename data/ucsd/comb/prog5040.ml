
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n < 10 then n else (let summed = sumList n in digitalRoot summed);;
