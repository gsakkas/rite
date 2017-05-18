
let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let _ = sumList [1.1];;
