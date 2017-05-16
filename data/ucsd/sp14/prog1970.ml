
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n = if n < 10 then n else digHelper (sumList n) in
  digHelper n;;
