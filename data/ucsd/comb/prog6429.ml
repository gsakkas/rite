
let rec sumList xs = if (List.length xs) > 0 then (List.hd xs) + (sumList xs);;
