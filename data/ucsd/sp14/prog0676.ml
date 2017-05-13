
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec addPHelper n pos =
  let sum = sumList pos in if sum < 10 then sum else addPHelper sum;;
