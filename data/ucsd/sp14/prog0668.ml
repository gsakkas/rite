
let rec length = function | [] -> 0 | _::l -> 1 + (length l);;

let rec sumList xs = if (length xs) = 0 then 0;;
